//
//  ViewController.swift
//  FSynchronized
//
//  Created by 邹奂霖 on 2019/8/2.
//  Copyright © 2019 邹奂霖. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var testArray = [Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<5000{
            let disQueue = DispatchQueue.global(qos: .default)
            disQueue.async {
                
            }
        }
    }
    
    func testThreadArray() -> Void {
        
    }
    
    


}

