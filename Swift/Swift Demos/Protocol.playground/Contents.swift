import UIKit

var str = "Hello, playground"

protocol SomeProtocol{
    var mutableSettable: Int {get set}
    var doesNotNeedToBeSettable: Int {get}
}

protocol AnotherProtocol{
    static var someTypeProperty: Int {get set}
}

protocol FullyNamed{
    var fullName: String {get}
}

struct Person: FullyNamed{
    var fullName: String // instance property
}

let john = Person(fullName: "John Appleased")


class StarShip: FullyNamed{
    var fullName: String{
        return (prefix != nil ? prefix! + " " : "") + name
    }
    
    var prefix: String?
    var name: String
    
    init(name: String , prefix: String?) {
        self.name = name
        self.prefix = prefix
    }
    
}

let ac001 = StarShip(name: "Enterprise", prefix: "USCC")
print(ac001.fullName)



// 协议方法不能设置默认参数
protocol SomeProtocol{
    static func someTypeMethod()
    static func someClaseTypeMethod() // 协议里的类型方法只能用static声明，class是放在类型里的。
}

protocol RandomNumberGenerator{
    func random() -> Double
}


class LinearCongruentialGenerator: RandomNumberGenerator{
    var lastRandom = 42.0
       let m = 139968.0
       let a = 3877.0
       let c = 29573.0
       func random() -> Double {
           lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
           return lastRandom / m
       }
}

// 异变方法
protocol Toggel{
    mutating func toggle()
}

enum OffSwitch: Toggel{
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OffSwitch.off
lightSwitch.toggle()
print(lightSwitch)

protocol SomeProtocolInitializer{
    init()
}

class SomeSuperClassInitializer{
    init() {
        
    }
}

class SomeSonClassInit: SomeSuperClassInitializer{
    required override init() {
        // 子类重写父类制定初始化器，并遵循协议实现了初始化要求，就需要添加required和override
    }
}

// required需要了解一下初始化器，还有可失败的初始化
