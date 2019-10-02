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
