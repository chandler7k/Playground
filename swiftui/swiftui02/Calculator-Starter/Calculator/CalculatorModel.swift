//
//  CalculatorModel.swift
//  Calculator
//
//  Created by houdini on 2020/4/17.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
class CalculatorModel: ObservableObject{
    /// 这里必须得删掉，貌似passThroughSubject会抢占published标记的属性监听。
//    let objectWillChange = PassthroughSubject<Void,Never>()
    
    @Published var brain: CalculatorBrain = .left("0")
    @Published var history: [CalculatorButtonItem] = []
    var historyDetail:String{
        history.map{$0.description}.joined()
    }
    
    var temporyKept: [CalculatorButtonItem] = []
    
    var totalCount: Int{
        history.count + temporyKept.count
    }
    
    var slidingIndex: Float = 0{
        didSet{
            keepHistory(upTo: Int(slidingIndex))
        }
    }
    
    func apply(item: CalculatorButtonItem) -> Void {
        brain = brain.apply(item: item)
        history.append(item)
        temporyKept.removeAll()
        slidingIndex = Float(totalCount)
    }
    
    func keepHistory(upTo index: Int) -> Void {
        precondition(index <= totalCount, "Out of box")
        let total = history + temporyKept
        history = Array(total[..<index])
        temporyKept = Array(total[index...])
        
        brain = history.reduce(CalculatorBrain.left("0"), { (result, item) -> CalculatorBrain in
            result.apply(item: item)
        })
        
    }
}
