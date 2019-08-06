import UIKit
//https://stackoverflow.com/questions/28067818/swift-overriding-didset-results-in-a-recursion
var str = "Hello, playground"

class TiwceInt{
    var value: Int = 0 {
        didSet{
            value *= 2
        }
    }
    var name: String = "hel"{
        didSet{
            name += "super"
        }
    }
}

class QuadInt: TiwceInt{
    override var value: Int{
        didSet{
            super.value *= 4
        }
    }
    
    override var name: String{
        didSet{
            super.name += "sub"
        }
    }
}

let t = TiwceInt()
t.value = 5

let q = QuadInt()
q.value = 5
q.name = "object"
