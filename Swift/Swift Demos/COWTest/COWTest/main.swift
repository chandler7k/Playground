//
//  main.swift
//  COWTest
//
//  Created by zouhuanlin on 2019/3/19.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

import Foundation


class TestClass{
    var value: String
    init(value: String) {
        self.value = value
    }
}
struct TestStruct {
    var testClass = TestClass(value: "hello")
}


var test1 = TestStruct()
var test2 = test1
print(test1.testClass.value)
print(test2.testClass.value)

test1.testClass.value = "world"

print(test1.testClass.value)
print(test2.testClass.value)





