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
    let objectWillChange = PassthroughSubject<Void,Never>()
    @Published var brain: CalculatorBrain = .left("0")
    @Published var history: [CalculatorButtonItem] = []
}
