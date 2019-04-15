//
//  ViewController.swift
//  RealmDemo
//
//  Created by chandler7k on 2019/4/11.
//  Copyright © 2019 chandler7k. All rights reserved.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let persons = realm.objects(Person.self)
        if persons.count > 0{
            print(persons.count)
            return
        }
        
        let dog1 = Dog()
        dog1.name = "chichi"
        dog1.age = 2
        
        let dog2 = Dog()
        dog2.name = "haha"
        dog2.age = 93
        
        let person1 = Person(value: ["rachel", 29, dog1])
        let person2 = Person(value: ["elder", 93, dog2])
        
        try! realm.write {
            realm.add(person1)
            realm.add(person2)
        }
        
//        print(persons) 
//        print(realm.configuration.fileURL!)
        print(persons.count)
        
        DispatchQueue(label: "background").async {
            autoreleasepool{
                let realm = try! Realm()
                let personWithDog = realm.objects(Person.self).filter("dog.age == 93").first
                try! realm.write {
                    personWithDog!.age = 94
                }
                print(personWithDog!.age)
            }
        }
        
    }


}

