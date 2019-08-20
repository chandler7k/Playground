//
//  ViewController.swift
//  Office_Practice
//
//  Created by 邹奂霖 on 2019/8/20.
//  Copyright © 2019 邹奂霖. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var label: UILabel = {
        var label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100));
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(self.label)
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true // font size based on the dynamic type setting by the user
        
        guard let customFont = UIFont(name: "CustomFont-Light", size: UIFont.labelFontSize) else{
//            fatalError("Failed to load the  font")
        }
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if(self.traitCollection.verticalSizeClass != previousTraitCollection?.verticalSizeClass){
            print("verticalSizeClass Changed")
        }
    }


}

