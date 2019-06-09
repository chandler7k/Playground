import Cocoa
import Foundation

struct Address{
    let city: String
}

@dynamicMemberLookup
struct Person{
    let name: String
    let address: Address
    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }
    subscript<T>(dynamicMember keyPath: KeyPath<Address, T>) -> T{
        return self.address[keyPath:keyPath]
    }
}


let address = Address(city: "Hangzhou")
let person = Person(name: "Chandler", address: address)

person.city
