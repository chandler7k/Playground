//
//  main.swift
//  SwifterMainT
//
//  Created by chandler7k on 2019/3/23.
//  Copyright © 2019 chandler7k. All rights reserved.
//

import Foundation
import UIKit
class MyApplication: UIApplication{
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        print("event sent: \(event.allTouches)")
    }
}

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, NSStringFromClass(MyApplication.self), NSStringFromClass(AppDelegate.self))
