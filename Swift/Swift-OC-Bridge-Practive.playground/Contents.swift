import Foundation
var str = "Hello, playground"
public class Robot: NSObject{
    var name: String!
    init!(name: String!){
        self.name = name
    }
    func tellMeSomething() {
        print(name)
    }
}

let rob = Robot(name: "hello")
rob!.tellMeSomething()
