//
//  ViewController.swift
//  BullEye
//
//  Created by 邹奂霖 on 2018/2/23.
//  Copyright © 2018年 邹奂霖. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    var currentValue: Int = 50
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        startNewRound()
        startNewGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //present alert
    @IBAction func showAlert(){
        let difference: Int = abs(currentValue - targetValue)
        var points: Int = 100 - difference
        round += 1
        let message = "You scored \(points) points"
        let title: String
        if difference == 0{
            title = "Perfect!"
            points += 100
        }else if difference < 5{
            title = "You almost had it!"
            if difference == 1{
                points += 50
            }
        }else if difference < 10{
            title = "Pretty good!"
        }else{
            title = "You are not even close."
        }
        score += points
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in self.startNewRound()}) // closure
        
        alert.addAction(action) //message
        present(alert, animated: true, completion: nil)
//        startNewRound()
    }
    //detect slider move
    @IBAction func sliderMoved(_ slider:UISlider){
        currentValue = lroundf(slider.value)
    }
   
    //start new round
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLable()
    }
    
    //update lable
    func updateLable(){
        targetLable.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    //start new game
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
}

