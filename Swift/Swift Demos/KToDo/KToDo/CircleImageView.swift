//
//  SwiftUIView.swift
//  KToDo
//
//  Created by chandler7k on 2019/6/8.
//  Copyright © 2019 chandler7k. All rights reserved.
//

import SwiftUI

struct CircleImageView : View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

#if DEBUG
struct SwiftUIView_Previews : PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
#endif
