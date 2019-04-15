//
//  Model.swift
//  RealmDemo
//
//  Created by chandler7k on 2019/4/11.
//  Copyright © 2019 chandler7k. All rights reserved.
//

import Foundation
import RealmSwift

class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var dog: Dog?
    
    override static func primaryKey() -> String{
        return "name"
    }
}

