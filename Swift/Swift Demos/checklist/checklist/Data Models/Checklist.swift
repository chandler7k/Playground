//
//  Checklist.swift
//  checklist
//
//  Created by ChandlerZou on 2018/3/26.
//  Copyright © 2018年 邹奂霖. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var iconName = "No Icon"
//    var 
    var items = [ChecklistItem]()
    
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    func countUncheckedItems() -> Int{
        var count = 0
        for item in items where !item.checked{
            count += 1
            
        }
        return count
    }
}
