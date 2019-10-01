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


