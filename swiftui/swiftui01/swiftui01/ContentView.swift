//
//  ContentView.swift
//  swiftui01
//
//  Created by 邹奂霖 on 2020/4/15.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

import SwiftUI
let scale: CGFloat = UIScreen.main.bounds.width / 414
struct ContentView: View {
    var body: some View{
        VStack(spacing: 12){
            Spacer()
            Text("0").font(.system(size: 76)).lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            CalculatorButtonPad().padding(.bottom)
        }
    .scaleEffect(scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView().environment(\.colorScheme, .dark)
        }
    }
}

struct CalculatorButton: View {
    let fontSize: CGFloat=38
    let title:String
    let size: CGSize
    let backgroundColorName:String
    let fontColor:Color
    let action:()->Void
    var body: some View {
        Button(action:action) {
            Text(title)
                
                .font(.system(size: fontSize))
                .foregroundColor(fontColor)
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width/2)
                
            
        }
    }
}


struct CalculatorButtonRow: View {
   let row: [CalculateButtonItem]
    var body: some View {
        HStack{
            ForEach(row, id: \.self){ item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName,fontColor: item.fontColor) {
                    print("button: \(item.title)")
                }
            }
        }
    }
}

struct CalculatorButtonPad:View {
    let pad:[[CalculateButtonItem]] = [
        [.command(.clear),.command(.flip),.command(.percent),.op(.devide)],
        [.digit(7),.digit(8),.digit(9),.op(.plus)],
        [.digit(4),.digit(5),.digit(6),.op(.plus)],
        [.digit(1),.digit(2),.digit(3),.op(.plus)],
        [.digit(0),.dot,.op(.equal)]
    ]
    var body: some View{
        VStack(spacing:8){
            ForEach(pad,id: \.self){row in
                CalculatorButtonRow(row:row)
            }
        }
    }
}


