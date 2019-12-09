import UIKit

var str = "Hello, playground"
let one: Int8 = 1
let twoThousand: Int16 = 2000
let twoKAddOne = twoThousand + Int16(one)
// someType(ofInitialValue)

let threeInt = 3
let point1 = 0.1
// error
//let onepointthree = threeInt + point1
//let onepointthree = point1 + threeInt
let onepointthree = Double(threeInt) + point1

