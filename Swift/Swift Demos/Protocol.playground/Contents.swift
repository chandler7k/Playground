import UIKit

var str = "Hello, playground"
struct SomeStructure{
    static var sotredTypeProperty = "some value"
    static var computedTypeProerty : Int{
        return 1
    }
}

enum SomeEnumeration{
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 27
    }
}

class SomeClass{
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 27
    }
    // 类型的类型属性用class标记用来继承,可以重写父类实现
    class var overrideableCompuredTypeProprety: Int {
        return 108
    }
    
    static var readWriteComputedTypeProerty: String = ""{
        didSet{
            storedTypeProperty = readWriteComputedTypeProerty
        }
    }
}

class SomeSonClass: SomeClass{
    override class var overrideableCompuredTypeProprety: Int{
        return 19;
    }
}


print(SomeSonClass.overrideableCompuredTypeProprety)
print(SomeSonClass.storedTypeProperty)
SomeSonClass.storedTypeProperty = "some son value" // static的存储类型属性也可以继承，可以修改，
print(SomeSonClass.storedTypeProperty)

// SomeSonClass.computedTypeProperty = 15 // 本例中static标记的计算类型属性只读，不能被重写；当然也可以定义可写的计算类型属性用static去标记,看下面
print(SomeSonClass.computedTypeProperty)
// query & set
// query & set type class with dot syntax
SomeStructure.sotredTypeProperty = "change structure type property"
print(SomeStructure.sotredTypeProperty)

print(SomeSonClass.readWriteComputedTypeProerty)
print(SomeSonClass.storedTypeProperty)
SomeSonClass.readWriteComputedTypeProerty = "change read write compute type property" // 用static标记的可写的计算类型属性
print(SomeSonClass.readWriteComputedTypeProerty)
print(SomeSonClass.storedTypeProperty)


// model
struct AudioChannel{
    static let thresHoldLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet{
            if currentLevel > AudioChannel.thresHoldLevel{
                currentLevel = AudioChannel.thresHoldLevel
                print("currentLevel changed to \(currentLevel)")
                // This does not cause the observer to be called again.
                // why?
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var audioTest = AudioChannel()
audioTest.currentLevel = 7
print(audioTest.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

var leftChannel = AudioChannel()
leftChannel.currentLevel = 11
print(AudioChannel.maxInputLevelForAllChannels)


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


