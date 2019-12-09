//
//  AppDelegate.swift
//  mac01
//
//  Created by 邹奂霖 on 2019/12/9.
//  Copyright © 2019 xinhuamm. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var modalWindow: NSWindow!
    var sessionCode: NSApplication.ModalSession?
    
    var myWindow: NSWindow!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        NotificationCenter.default.addObserver(self, selector: #selector(self.windowClose(_:)), name: NSWindow.willCloseNotification, object: nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func showModalWindowAction(_ sender: NSButton){
        NSApplication.shared.runModal(for: self.modalWindow)
    }
    
    @IBAction func showModalSession(_ sender: NSButton){
        sessionCode = NSApplication.shared.beginModalSession(for: self.modalWindow)
    }
    
    @IBAction func createNewWindow(_ sender: NSButton){
        createMyWindow()
    }
    
    @objc func windowClose(_ aNotification: Notification){
        if let sessionCode = sessionCode{
            NSApplication.shared.endModalSession(sessionCode)
            self.sessionCode = nil
        }
        
        if let window = aNotification.object as? NSWindow{
            if(self.modalWindow == window){
                NSApplication.shared.stopModal()
            }
            
            if window == self.window{
                NSApp.terminate(self)
            }
        }
    }
    
    
    
    func createMyWindow(){
        let frame = CGRect(x: 0, y: 0, width: 400, height: 200)
        let style: NSWindow.StyleMask = [.titled, .closable, .resizable]
        myWindow = NSWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
        myWindow.title = "new create window"
        myWindow.makeKeyAndOrderFront(self)
        myWindow.center()
    }

}

