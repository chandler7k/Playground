//
//  ContentView.swift
//  KToDo
//
//  Created by chandler7k on 2019/6/7.
//  Copyright © 2019 chandler7k. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack{
            MapView().edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImageView()
                .offset(y:-130)
                .padding(.bottom,-130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                    .multilineTextAlignment(.center)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                }
                .padding()
            Spacer()
        }
    }
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
