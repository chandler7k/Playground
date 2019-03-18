import UIKit

var str = "Hello, playground"


class Person: Equatable{
    let ssn: Int
    let name: String
    init(ssn: Int, name: String) {
        self.ssn = ssn
        self.name = name
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
    
    
}

let personA = Person(ssn: 10, name: "Bob")
let personB = Person(ssn: 1, name: "Bob")
personA == personB

personA === personB

let personC = personA
personC == personA
personC === personA

struct HColor{
    let red: UInt8
    let green: UInt8
    let blue: UInt8
}

extension HColor: Hashable{
    
    func hash(into hasher: inout Hasher){
        hasher.combine(self.red)
        hasher.combine(self.green)
        hasher.combine(self.blue)
    }
    var hashValue: Int{
        var hasher = Hasher()
        self.hash(into: &hasher)
        return hasher.finalize()
    }
    
}

let cyan = HColor(red: 0x00, green: 0xFF, blue: 0xFF)
let yellow = HColor(red: 0xFF, green: 0xFF, blue: 0x00)

cyan.hashValue == yellow.hashValue
