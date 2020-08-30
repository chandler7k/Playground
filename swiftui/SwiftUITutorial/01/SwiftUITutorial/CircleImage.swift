//
//  CircleImage.swift
//  SwiftUITutorial
//
//  Created by 邹奂霖 on 2020/8/29.
//  Copyright © 2020 邹奂霖. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
