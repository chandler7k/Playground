//
//  ViewController.swift
//  LLDB_Practice
//
//  Created by 邹奂霖 on 2019/8/2.
//  Copyright © 2019 邹奂霖. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.redView)
        self.view.addSubview(self.button)
        self.test()
    }
    
    lazy var redView: UILabel = {
       let view = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = UIColor.red
        return view
    }()
    
    lazy var button:UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 50, height: 50))
        button.backgroundColor = UIColor.yellow
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonAction(){
        self.redView.text = "py test"
    }
    
    func test() -> Void {
        self.redView.backgroundColor = UIColor.green
        self.redView.text = "hello"
//        print("1")
//        print("2")
//        print("3")
        count = 2
    }

}

