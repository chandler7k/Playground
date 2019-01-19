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
