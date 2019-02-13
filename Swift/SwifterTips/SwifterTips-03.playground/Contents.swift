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






