import Foundation
// 协议和类方法中的self
//Swift中，希望在协议中使用的类型就是实现这个协议本身的类型的话，使用Self
protocol Copyable{
    func copy() -> Self
}
class MycpClass: Copyable{
    var num = 1
    func copy() -> Self {
        let cp = type(of: self).init()
        cp.num = num
        return cp
    }
    required init(){
        
    }
}

let objcp = MycpClass()
objcp.num = 100

let newobjcp = objcp.copy()
objcp.num = 1

print(objcp.num)
print(newobjcp.num)

//动态类型和多防范
//Swift不支持多方法，不能根据对象在运行时进行合适的方法重载，只能在代码层面对输入类型进行判断和转换，并在编译器执行。

//属性观察
//初始化方法的调用，以及在属性观察方法内部对属性进行修改都不会再次触发属性观察
//存储属性在内存中存分配实际地址，计算属性并没有背后的存储
//同一类型，计算属性和属性观察不能共存，set 和 willSet/didSet只能存在一种，我们可以通过子类继承，对父类属性进行观察
class MyClassOP{
    let oneYearInSecond: TimeInterval = 365 * 24 * 60 * 60
    var date: Date {
        willSet{
            let d = date
            print("going to set date: \(date) to new date: \(newValue)")
        }
        didSet{
            if (date.timeIntervalSinceNow > oneYearInSecond){
                print("the date set is too late")
                date = date.addingTimeInterval(oneYearInSecond)
            }
            print("did set date to: \(date)")
        }
        
    }
    
    init() {
        date = Date()
    }
}

let fooOP = MyClassOP()
fooOP.date = fooOP.date.addingTimeInterval(100000000)
print(fooOP.date)

class Aop{
    var numnber: Int{
        get{
            print("get")
            return 1
        }
        set{
            print("set")
        }

    }
}

class Bop: Aop{
    override var numnber: Int{
        willSet{
            print("willSet")
        }
        didSet{
            print("didSet")
        }
    }
}

var bop = Bop()
bop.numnber = 3

// Final
// 用在class func 和属性前面，表示不能被继承或者重写
// Final可以理解为”最终“，也就是说已经写的差不多了，不用再修改了，而且没有必要重写或者继承
// 有些情况下，父类方法的实现必须必须通过子类继承才能实现，然而一般情况下，子类重写了父类方法就不能强制子类方法去调用父类方法，
//这时可以通过一个在父类中设置一个final方法，去调用一个可以继承的方法，然后让子类去重写这个可以继承的方法，然后直接通过子类去调用这个final方法

// final 可能会带来性能的提升，因为编译器能够获得额外的信息，但是并不能跟OC的动态派发相比，所以如果是追求性能优化（UI、渲染等）不推荐通过添加final去实现。
class Parentfinal{
    final func method(){
        print("start config")
        methodImp()
        print("end config")
    }
    
    func methodImp(){
        fatalError("must be override")
    }
}

class Childfinal: Parentfinal{
    override func methodImp() {
        print("configing")
    }
}
let pf = Parentfinal()
let cf = Childfinal()
cf.method()

// lazy
//
class ClassALZ{
    lazy var str: String = {
        let str = "hello"
        print("only print for the first time")
        return str
    }()
}

let datalz = 1...3
let result = datalz.lazy.map { (i: Int) -> Int in
    print("handling \(i)")
    return i * 2
}

print("reach result")
for i in result{
    print("result is \(i)")
}
print("end")

//反射
struct PersonMR{
    let name: String
    let age: Int
}

let xiaoMing = PersonMR(name: "xiaoming", age: 16)
let r = Mirror(reflecting: xiaoMing)
print("xiaoming is  \(r.displayStyle!)")
print("property count\(r.children.count)")

for i in r.children{
    print("property name: \(String(describing: i.label)), value: \(i.value)")
}

dump(xiaoMing)

func valueFrom(_ object: Any, _ key: String) -> Any?{
    let mirror = Mirror(reflecting: object)
    
    for child in mirror.children{
        let (targetKey, targetValue) = (child.label, child.value)
        if (key == targetKey){
            return targetValue
        }
    }
    
    return nil
}

if let name = valueFrom(xiaoMing, "name") as? String{
    print(name)
}

// 隐式解包
//所以隐式解包存在的意义就是，OC的API可以返回为空，因为OC的消息传递可以将消息传递给nil，如果OC代码映射到Swift中，XCode默认映射为optional类型，就是为了防止OC的结果为空。在确定OC的结果一定不为空的时候使用隐式解包，就可以像正常函数一样去调用，而不是复杂的可选链。
// Xcode新加的NON_NULL关键字让上述操作更简化，只要在可为空的OC API加上nullable关键字修饰就可以单独确定一个可为空的API，映射的时候除了它意外其他全部都是正常类型的API


// 多重Optional
//optional 加？本质上就是一个枚举
var literalOpstring: String?? = "hello"
print(literalOpstring)

var aNil: String? = nil

var anotherNil: String?? = aNil
var litNil: String?? = nil

if anotherNil != nil{
    print("another nil")
}

if litNil != nil{
    print("lit nil")
}


// optional map
// map 对集合内的元素应用某种规则，并返回一个新的集合
let nummop: Int? = 3
let resultmop = nummop.map{
    return $0 * 2
}
print(resultmop)

// Protocol extension
protocol MyPEProtocol{
    func method()
}

extension MyPEProtocol{
    func method(){
        print("call pe method")
    }
}

struct MyPEStruct: MyPEProtocol{
    func method() {
        print("call in struct")
    }
}

MyPEStruct().method()

protocol Ape1{
    func method() -> String
}

struct Bpe1: Ape1{
    func method() -> String {
        return "hello"
    }
}

let b1 = Bpe1()
b1.method()

let a1: Ape1 = Bpe1()
a1.method()

protocol Ape2{
    
    func method1() -> String
}

extension Ape2{
    func method1() -> String{
        return "hi"
    }
    
    func method2() -> String{
        return "hi"
    }
    
    func method3() -> String{
        return "method3"
    }
}


struct B2: Ape2{
    func method1() -> String {
        return "hello"
    }
    
    func method2() -> String {
        return "hello"
    }
    
    
}

let b2 = B2()
b2.method1()
b2.method2()

let a2 = b2 as Ape2
a2.method1()
a2.method2()
a2.method3()

// where 和 模式匹配
let name = ["王二","王小波", "X海英"]

name.forEach{
    switch $0 {
    case let x where x.hasPrefix("王"):
        print("\(x) is the author")
    default:
        print("hello \($0)")
    }
}

let numw: [Int?] = [99,48, nil]
let nw = numw.flatMap{$0}

for score in nw where score > 60{
    print(" pass \(score)")
}

numw.forEach{
    if let score  = $0, score > 60{
        print(", pass \(score)")
    }else{
        print("fail")
    }
}
// 注意 现在版本中 泛型的 where M模式匹配必须要在返回类型后声明
// 旧版本才在泛型 <> 内声明
public func != <T: RawRepresentable>(lhs: T, rhs: T) -> Bool where T.RawValue: Equatable{
    return rhs.rawValue != lhs.rawValue
}
// 可以用where来限定协议的扩展方法在某些特定条件下才能使用
//extension Sequence where Self.Iterator.Element: Comparable{
//    public func sorted() -> [Self.Iterator.Element]
//}

// indirect enum

indirect enum LinkedList<Element: Comparable>{
    case empty
    case node(Element, LinkedList<Element>)
    func removing(_ element: Element) -> LinkedList<Element>{
        guard case let .node(value,next) = self else{
            return .empty
        }
        return value == element ? next : LinkedList.node(value, removing(element))
    }
}
let linkedlist = LinkedList.node(1, .node(2, .node(3, .node(4, .empty))))
print(linkedlist)
//linkedlist.removing(2)
print(linkedlist)



