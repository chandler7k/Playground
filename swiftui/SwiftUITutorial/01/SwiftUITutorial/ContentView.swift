//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by 邹奂霖 on 2020/8/29.
//  Copyright © 2020 邹奂霖. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height:300)
            
            CircleImage()
                .offset(y:-130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) { // alignment 管理content对其方式
                Text("Turtle Rock!")
                    .font(.title)
                
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer() // spacer允许子视图利用父视图所有空间，而不是根据内容布局
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()// 返回一个带有padding的view
            
            Spacer()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
