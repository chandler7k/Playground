import Cocoa
import Foundation


func addOne(num: Int) -> Int{
    return num + 1
}

func addTo(_ adder: Int) -> (Int) -> Int{
    return {
        num in
        return num + adder
    }
}

let addTen = addTo(10)
print(addTen(1))


protocol TargetAction{
    func performAction()
}


struct TargetActionWrapper<T: AnyObject>: TargetAction{
    weak var target: T?
    let action:(T) -> () -> ()
    func performAction() {
        if let t = target{
            action(t)
        }
    }
}

enum ControlEvent{
    case touchUpInside
    case valueChanged
}

class Control{
    var actions = [ControlEvent: TargetAction]()
    func setTarget<T: AnyObject>(_ target: T, action: @escaping (T) -> () -> (), controlEvent: ControlEvent){
        actions[controlEvent] = TargetActionWrapper(target: target, action: action)
        
    }
    
}


let swiftInt: Int = 1
let swiftString: String = "hello"

var arrray: [AnyObject] = []

arrray.append(swiftInt as AnyObject)
arrray.append(swiftString as AnyObject)
print(arrray)


protocol Vehicle{
    var numberOfWheels: Int {get}
    var color: String {get set}
    mutating func changeColor()
}


struct MyCar: Vehicle{
    let numberOfWheels: Int = 4
    var color: String = "blue"
    
    mutating func changeColor() {
        color = "red"
    }
    
    
}

// Iterator  Sequence

class ReverseIterator<T>: IteratorProtocol{
    typealias Element = T
    
    var array: [Element]
    var currentIndex = 0
    
    init(array: [Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
    func next() -> Element? {
        if currentIndex < 0{
            return nil
        }
        
        else{
            let element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}


struct ReverseSequence<T>: Sequence{
    var array: [T]
    init(array: [T]) {
        self.array = array
    }
    
    typealias Iterator = ReverseIterator<T>
    
    func makeIterator() -> ReverseIterator<T> {
        return ReverseIterator(array: self.array)
    }
    
}


let arr = [0,1,2,3,4]

for i in ReverseSequence(array: arr){
    print("Index \(i) is \(arr[i])")
}

// Tuple

func swapT<T>(a: inout T, b: inout T){
    (a,b) = (b,a)
}
var a = 1
var b = 2
swap(&a, &b)
print(a,b)


let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
let (small, large) = rect.divided(atDistance: 20, from: .minXEdge)

print(small)

//MARK: - autoclosure

func logIfTrue(_ predicate: @autoclosure () -> Bool){
    if predicate(){
        print("true")
    }
}



logIfTrue(2 > 1)

var level: Int?
var startLevel = 1

var currentLevel = level ?? startLevel

func dowork(block: () -> ()){
    block()
}

dowork {
    print("work")
}


func doWorkAsync(block: @escaping () -> ()){
    DispatchQueue.main.async {
        block()
    }
}


class S{
    var foo = "foo"
    func method1(){
        dowork {
            print("foo")
        }
        foo = "bar"
    }
    
    func method2(){
        doWorkAsync {
            print(self.foo)
        }
        
        foo = "bar2"
    }
}

S().method1()
S().method2()

protocol P{
    func work(b: @escaping () -> ())
}

class C: P{
    func work(b: @escaping () -> ()) {
        DispatchQueue.main.async {
            print("in c")
            b()
        }
    }
}

// Optional chaining
class Toy{
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Pet{
    var toy: Toy?
    
}

class Child{
    var pet: Pet?
}

extension Toy{
    func play(){
        print("playing")
    
    }
}

let playClosure = {{(child: Child) -> ()? in return child.pet?.toy?.play()}}




// 操作符
struct Vector2D{
    var x = 0.0
    var y = 0.0
    
}

let v1 = Vector2D(x: 2.0,y: 1.0)
let v2 = Vector2D(x: 1.0,y: 4.0)
let v3 = Vector2D(x: v1.x + v2.x,y: v1.y + v2.y)
func +(left: Vector2D,right: Vector2D) -> Vector2D{
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
    
}

let v4 = v1 + v2

precedencegroup DotProductPrecedence{
    associativity: left
    higherThan: MultiplicationPrecedence
    
}
infix operator +*: DotProductPrecedence

func +*(left: Vector2D,right: Vector2D) -> Double{
    return left.x * right.x + left.y * right.y

}
let v5 = v1 +* v2

// func参数修饰
func incrementor(variable: Int) -> Int{
    var variable = variable
    variable += 1
    return variable
}

func incrementor(variable: inout Int){
    variable += 1
}

var luckNumber = 1
incrementor(variable: &luckNumber)
print(luckNumber)


func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()){
    
    func makeIncrementor(variable: inout Int) ->(){
        variable += addNumber
    }
    
    return incrementor
}

var make2 = makeIncrementor(addNumber: 2)
var ln = 3

make2(&ln)

print(ln)

func foo(){
    var x = 1
    var xPlusOne: Int {
        return x + 1
    }
    
    print(xPlusOne)
}

foo()

enum MyBool: Int{
    case myTrue, myFalse
}

extension MyBool: ExpressibleByBooleanLiteral{
//    typealias BooleanLiteralType = Bool
    init(booleanLiteral value: Bool) {
        self = value ? .myTrue : .myFalse
    }
    
    
}

let myTrue: MyBool = true
myTrue.rawValue

class Person: ExpressibleByStringLiteral{
    typealias StringLiteralType = String
    typealias ExtendedGraphemeClusterLiteralType = String
    typealias UnicodeScalarLiteralType = String
    
    let name: String
    init(name value: String){
        self.name = value
    }


    required convenience init(stringLiteral value: Person.StringLiteralType) {
        self.init(name: value)
    }
    required convenience init(extendedGraphemeClusterLiteral value: Person.ExtendedGraphemeClusterLiteralType) {
        self.init(name: value)
    }
    required convenience init(unicodeScalarLiteral value: Person.UnicodeScalarLiteralType) {
        self.init(name: value)
    }
    
}

let p: Person = "xiaoming"
print(p.name)


// next: subscript
extension Array{
    subscript(input: [Int]) -> ArraySlice<Element>{
        get {
            var result = ArraySlice<Element>()
            for i in input{
                assert(i < self.count, "Index out of range")
                result.append(self[i])
            }
            return result
        }
        
        set{
            for (index,i) in input.enumerated(){
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
        
    }
}

var arrSub = [1,2,3,4,5]
arrSub[[0,2,3]]
arrSub[[0,2,3]] = [2,4,1]
arrSub


// 方法嵌套
//方法内部q可以声明方法


//命名空间
//命名空间主要是对比OC没有namespace，所以必须加前缀


//typealias

class Persion<T>{}
typealias Worker<T> = Persion<T>
typealias WorkId = String
typealias Worker1 = Persion<WorkId>

protocol Cat{}
protocol Dog{}

typealias Pat = Cat & Dog


typealias Pat2 = Cat & Dog

// associatetype

protocol Food{

}


protocol Animal{
    associatedtype F: Food
    func eat(food: F)
}

struct Meat: Food{}
struct Grass: Food{}
struct Tiger: Animal {
    typealias F = Meat
    func eat(food: Meat) {
        print("eat meat")
    }
}
let meat = Meat()

let tiger = Tiger()
tiger.eat(food: meat)




