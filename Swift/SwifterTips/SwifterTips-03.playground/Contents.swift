import Cocoa

var str = "Hello, playground"
// Selector
//Swift中默认方法对Objc不可见，必须添加@objc关键字，私有方法不可见，在private前添加@objc关键字
//当前作用域如果没有同名方法，可以不写参数，如果存在函数名相同的，编译器无法识别，必须使用强制转换
//let methodS1 = #selector(commonFunc as ()->())
//let methodS2 = #selector(commonFunc as (Int)->(Int))
//
//@objc func callMe(){
//
//}
//
//let someMethod = #selector(callMe)


//实例方法的动态调用
class MyClassSL{
    func methodSL(number: Int) -> Int{
        return number + 1
    }
}

//正常的生成实例，然后调用方法
//这种方法只限制在了编译期，在编译期就已经决定了实例和调用的方法
let objectSL1 = MyClassSL()
let resultSL1 = objectSL1.methodSL(number: 1)


//这里使用Type.instanceMehtod去获取methodSL
//f1的类型是：(MyClassSL) -> (Int) -> Int 相当于一个科里化
let f1 = MyClassSL.methodSL
let objectSL2 = MyClassSL()
let resultSL2 = f1(objectSL2)(1)

//注意如果有同名的类方法，使用Type.instanceMethod默认会得到类方法
class MyClassSLJ{
    class func methodSL(number: Int) -> Int{
        return number + 1
    }
    
    func methodSL(number: Int) -> Int{
        return number + 1
    }
}

//想要钦点方法，必须加类型声明
let fSJ2: (MyClassSLJ) -> (Int) -> Int = MyClassSLJ.methodSL // func methodSL
let fSJ21 = MyClassSLJ.methodSL // class func methodSL

let fSJ1 = MyClassSLJ.methodSL

// 单例
class MyClassDL{
    class var sharedManager: MyClassDL{
        struct Static{
            static let sharedInstance: MyClassDL = MyClassDL()
        }
        return Static.sharedInstance
    }
}

// 写法2
// 这种写法主要是swift1.2的时候没有存储属性，所以把sharedInstance放到外面
// 但是要注意访问权限，应该把sharedInstance限制在当前文件，所以设置为private
//private let sharedInsteanceDL2 = MyClassDL2() 报错 现在不支持了
//class MyClassDL2{
//    class var sharedManager: MyClassDL2{
//        return sharedInsteanceDL2
//    }
//}

// 当前
// swift当前版本的let在底层会把初始化包装在一个 dispatch_once_block_invoke 中
// 对于所有全局变量，swift都会使用dispatch_once_block_invoke
// 而且这里有一个private init，不公开初始化方法，只能通过单例实现，也保证力实例的唯一性
// 如果需要类似default的单例，也可以把private移除。
class MyManager{
    let sharedManager = MyManager()
    private init() {
        
    }
}


// 条件编译
#if os(macOS)
    typealias Color = NSColor
#else
    typealias Color = UIColor
#endif


// 编译标志
// MARK： - hello
// TODO: fix bug
// FIXME: fix
//尚且不支持 WARNING: FIX API HERE

// @UIApplicationMain
// C语言程序以main入口
// swift没有main，但是在AppDelagate内有@UIApplicationMain标记
// 编译的时候会寻找这个标记，然后自动插入main函数
// 如果要自定义main，就删除标记，然后创建main.swift 内部实现UIApplicationMain(Process.argv, Process.unsafeArgv, nil, NSStringFromClass(AppDelegate))
// 第三个参数可以换成自己的UIApplication子类

// @objc & dynamic



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
        return "mthod3"
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


func reverseString(_ s: inout [Character]) {
    s = s.reversed()
}






