import Cocoa

//var str = "Hello, playground"
enum SomeEnumeration{
    
}

enum CampassPoint{
    case north
    case sourth
    case east
    case west
}

//swift的case值并不会分配默认整数值, 每个枚举成员都有自己完全的值

//enum Planet{
//    case mecury, venus, earth, mars
//}

// 枚举类型的名字应该是单数

var directionToHead = CampassPoint.west
directionToHead = .east

directionToHead = .sourth
switch directionToHead {
case .north:
    print("lots of planets have a north")
case .sourth:
    print("watch out of penguins")
case .east:
    print("east")
case .west:
    print("west")
}
// swift enum 要求覆盖所有枚举成员，这样可以保证枚举成员不会被意外漏掉

//let somePoint = Planet.earth
//switch somePoint {
//case .earth:
//    print("mother planet")
//default:
//    print("not a safe place")
//}

enum Beverage: CaseIterable{
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases{
    print(beverage)
}

// allCases 可以当成是一个包含枚举元素的集合

let cF = Beverage.coffee
switch cF{
case .coffee:
    print("coffee")
default:
    print("default")
}

enum Barcode{
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarCode = Barcode.upc(0, 85, 51, 2)
//switch productBarCode{
//    case let .upc()
//}

enum ASCIIControlCharacter: Character{
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// 隐式制定原始值

// 整数作为原始值时，每个成员的隐式值逗比前一个大1
let sunsetDirection = CampassPoint.west

//let sunSetDirection = CampassPoint(rawValue: west)

// 原始值的初始化枚举返回的总是可选的枚举成员
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earthOrder = Planet.earth.rawValue
let possiblePlanet = Planet(rawValue: 7)

let positaionToFind = 11
//if let somePlanet = Planet(rawValue: positaionToFind){
//    switch somePoint {
//    case .earth:
//        print("mother russia")
//    default:
//        print("wula")
//    }
//}else{
//    print("thers is not a planet")
//}

// 枚举递归 indirect
indirect enum ArithmticExpression{
    case number(Int)
    case addition(ArithmticExpression, ArithmticExpression)
    case multiplication(ArithmticExpression, ArithmticExpression)
}
//
//indirect enum ArithmticExpression{
//    case number(Int)
//    case addition(ArithmticExpression,ArithmticExpression)
//    case multiplication(ArithmticExpression, ArithmticExpression)
//}

let five = ArithmticExpression.number(5)
let four = ArithmticExpression.number(4)
let sum = ArithmticExpression.addition(five, four)
let product = ArithmticExpression.multiplication(sum, ArithmticExpression.number(2))


enum Score{
    case Fail
    case Pass
    case Good
    case Perfect
    
    init(_ score: Int){
        if(score < 60){
            self = .Fail
        }else if(score < 80){
            self = .Pass
        }else if (score < 90){
            self = .Good
        }else{
            self = .Perfect
        }
    }
}

let score = Score(85)




