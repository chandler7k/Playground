import Cocoa
import Foundation
var str = "Hello, playground"


var queue = DispatchQueue(label: "tSalaon")
var concurrentQueue = DispatchQueue(label: "concurrent",attributes: .concurrent)

var searialQueue = OperationQueue()
searialQueue.maxConcurrentOperationCount = 1

queue.sync
{
    print(1)
}
print(2)
queue.async {
    print(3)
}
print(4)

var num = 0
DispatchQueue.global().async {
    for _ in 1...1000{
        num += 1
    }
}

for _ in 0...1000{
    num += 1
}


print(num)

var highPriorityQueue = DispatchQueue.global(qos: .userInitiated)
var lowPriorityQueue = DispatchQueue.global(qos: .userInitiated)

let semaphore = DispatchSemaphore(value: 1)

lowPriorityQueue.async {
    semaphore.wait()
    for i in 0...10{
        print(i)
    }
    semaphore.signal()
}

highPriorityQueue.async {
    semaphore.wait()
    for i in 11...20{
        print(i)
    }
    semaphore.signal()
}


let arrqueue = DispatchQueue.global()
var arr = [Int]()
for i in 0..<10{
    queue.async {
        print(i)
        arr.append(i)
    }
}


let operation: OperationQueue = OperationQueue()

let operatonMain: OperationQueue = OperationQueue.main

precedencegroup OperationChaining{
    associativity: left
}
infix operator ==>:OperationChaining

@discardableResult
func ==><T: Operation>(lhs: T, rhs: T) -> T{
    rhs.addDependency(lhs)
    return rhs
}



class AsyncOperation: Operation{
    override var isAsynchronous: Bool{
        return true
    }
    
    var _isFinished: Bool = false
    
    override var isFinished: Bool{
        set{
            willChangeValue(forKey: "isFinished")
            _isFinished = newValue
            didChangeValue(forKey: "isFinished")
        }
        
        get{
            return _isFinished
        }
    }
    
    var _isExecuting: Bool = false
    
    override var isExecuting: Bool{
        set{
            willChangeValue(forKey: "isExecuting")
            _isExecuting = newValue
            didChangeValue(forKey: "isExecuting")
        }
        
        get{
            return _isExecuting
        }
    }
    
    func execute(){
        
    }
    override func start() {
        isExecuting = true
        execute()
        isExecuting = false
        isFinished = true
    }
    
}

class TextOperation: AsyncOperation{
    let text: String
    
    init(text: String){
        self.text = text
    }
    
    override func execute() {
        print(text)
    }
}

class GroupOperation: AsyncOperation{
    let queue = OperationQueue()
    var operations:[AsyncOperation] = []
    var errors: [Error] = []
    override func execute() {
        print("group started")
        queue.addOperations(operations, waitUntilFinished: true)
        print("group done")
    }
    
    func finished(withError errors: [Error]){
        self.errors += errors
    }
}

class HelloWorldOperation: GroupOperation{
    override init(){
        super.init()
        let op = TextOperation(text: "Hello")
        let op2 = TextOperation(text: "World")
        
        op2.addDependency(op)
        operations = [op2,op]
    }
}

class OperationObserver: NSObject{
    init(operation: AsyncOperation){
        super.init()
        operation.addObserver(self, forKeyPath: "finished", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let key = keyPath else{
            return
        }
        
        switch key {
        case "finished":
            print("done")
        default:
            print("doing")
        }
    }
}
