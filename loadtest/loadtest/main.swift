//
//  main.swift
//  loadtest
//
//  Created by 邹奂霖 on 2020/1/5.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

import Foundation

print("Hello, World!")
class LoadTestObject:NSObject{
    
}
extension LoadTestObject{
    @objc public static func swiftLoad(){
        print("swift laod")
    }
    
    @objc public static func swiftinit(){
        print("init")
    }
}
