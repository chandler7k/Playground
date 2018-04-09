//
//  ChecklistItem.swift
//  checklist
//
//  Created by 邹奂霖 on 2018/3/14.
//  Copyright © 2018年 邹奂霖. All rights reserved.
//

import Foundation
import UserNotifications
class ChecklistItem: NSObject, Codable  {
    var text = ""
    var checked =  false
    var dueDate = Date()
    var shouldRemind = false
    var itemID: Int
    
    // MARK: - override
    override init(){
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    
    
    
    // MARK: - Private methods
    func toggleChecked(){
        checked = !checked
    }
    
    func scheduleNotification(){
        removeNotification()
        if shouldRemind && dueDate > Date(){
//            print("We should schedule a notificaion")
            let content = UNMutableNotificationContent()
            content.title = "Reminder:"
            content.body = text
            content.sound = UNNotificationSound.default()
            
            let calendar = Calendar(identifier: .gregorian)
            let components = calendar.dateComponents([.month,.day,.hour,.minute], from: dueDate)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            let request = UNNotificationRequest(identifier: "\(itemID)", content: content, trigger: trigger)
            
            let center = UNUserNotificationCenter.current()
            center.add(request)
            
            print("Scheduled: \(request) for itemID: \(itemID)")
            
            
        }
    }
    
    func removeNotification(){
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["\(itemID)"])
    }
    deinit {
        removeNotification()
    }
    
    
    
}
