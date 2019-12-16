import UIKit

var str = "Hello, playground"

DispatchQueue.main.async {
    print("hello1")
    DispatchQueue.main.async {
        print("hello2")
    }
}
