//
//  CalculateButtonItem.swift
//  swiftui01
//
//  Created by 邹奂霖 on 2020/4/15.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

import Foundation
import SwiftUI
enum CalculateButtonItem{
    enum OP: String {
        case plus = "+"
        case minus = "-"
        case devide = "/"
        case multiply = "*"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(OP)
    case command(Command)
    
}

extension CalculateButtonItem: Hashable{
    var title: String{
        switch self {
        case .digit(let value):return String(value)
        case .dot: return "."
        case .op(let op):return op.rawValue
        case .command(let command):return command.rawValue
        }
    }
    
    var size: CGSize{
        if case .digit(let value) = self, value == 0{
            return CGSize(width: 88*2+8, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
    var backgroundColorName:String{
        switch self {
        case .digit,.dot:return "digitBackground"
        case .op:return "operatorBackground"
        case .command: return "commandBackground"
        }
    }
    
    var fontColor:Color{
        switch self {
        case .command:return Color("commandFontColor")
        default:
            return Color.white
        }
    }
    
    
}
