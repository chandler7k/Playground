//
//  ViewController.swift
//  RXStart
//
//  Created by 邹奂霖 on 2019/7/10.
//  Copyright © 2019 邹奂霖. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
fileprivate let minimalUsernameLength = 5
fileprivate let minimalPasswordLength = 5
class ViewController: UIViewController {
    let disposeBag = DisposeBag()

    @IBOutlet weak var userNameOutlet: UITextField!
    
    @IBOutlet weak var userNameValidLabel: UILabel!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var passwordValidLabel: UILabel!
    
    @IBOutlet weak var doSomethingButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let usernameValid = userNameOutlet.rx.text.orEmpty
            .map{ $0.count >= minimalUsernameLength}
            .share(replay: 1)
        
        usernameValid
            .bind(to: passwordOutlet.rx.isEnabled)
            .disposed(by: disposeBag)
        
        usernameValid.bind(to: userNameValidLabel.rx.isHidden).disposed(by: disposeBag)
        
        let passwordValid = passwordOutlet.rx.text.orEmpty.map{ $0.count >= minimalPasswordLength }.share(replay: 1)
        
        passwordValid.bind(to: passwordValidLabel.rx.isHidden).disposed(by: disposeBag)
        
        let everyThingValid = Observable.combineLatest(usernameValid, passwordValid){ $0 && $1}
        
        everyThingValid.bind(to: doSomethingButton.rx.isEnabled).disposed(by: disposeBag)
        
        doSomethingButton.rx.tap.subscribe(onNext:{[weak self] _ in self?.showAlert()}).disposed(by: disposeBag)
        
    }
    
    func showAlert(){
        print("show alert")
        
    }

    
    

}

