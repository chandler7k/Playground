//
//  ViewController.swift
//  CameraViewPreview
//
//  Created by zouhuanlin on 2019/2/14.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cameraView = CameraView()
        cameraView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.view.addSubview(cameraView)
        
        
    }


}

