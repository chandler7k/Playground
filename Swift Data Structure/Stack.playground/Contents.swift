import Cocoa

import Foundation
protocol Stack {
    associatedtype Element
    
    var isEmpty: Bool{get}
    var size: Int{get}
    var peek: Element? {get}
    
    mutating func push(_ newElement: Element)
    mutating func pop() -> Element?
}

struct IntegerStack: Stack{
    typealias Element = Int
    var size: Int{return stack.count}
    var peek: Element?{return stack.last}
    
    mutating func push(_ newElement: Element) {
        stack.append(newElement)
    }
    
    mutating func pop() -> Element? {
        return stack.removeLast()
    }
    
    
    private var stack = [Element]()
    var isEmpty: Bool {return stack.isEmpty }
}


protocol Queue{
    associatedtype Element
    
    var isEmpty: Bool{get}
    var size: Int{get}
    var peek:Element?{get}

    mutating func enqueue(_ newElement: Element)
    mutating func dequeue() -> Element?
    
    
}

struct IntegetQueue: Queue{
    typealias Element = Int
    private var left = [Element]()
    private var right = [Element]()
    
    var isEmpty: Bool{return left.isEmpty && right.isEmpty}
    var size: Int{
        return left.count + right.count
    }
    var peek: Int?{return left.isEmpty ? right.first : left.last}
    
    mutating func enqueue(_ newElement: Int) {
        right.append(newElement)
    }
    
    mutating func dequeue() -> Int? {
        if left.isEmpty{
            left = right.reversed()
            right.removeAll()
            
        }
        return left.popLast()
    }
    
}


struct MyQueue{
    var stackA: Stack
    var stackB: Stack
    
    init() {
        stackA = Stack()
        stackB = Stack()
        
    }
    var isEmpty: Bool{
        return stackA.isEmpty && stackB.isEmpty
    }
    
    var peek: Any?{
        get{
            return stackB.peek
        }
    }
}




