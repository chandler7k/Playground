//
//  LandmarkList.swift
//  Landmarks
//
//  Created by chandler7k on 2019/6/8.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    var body: some View {
        NavigationView{
            List(landmarkData){ landmark in
                NavigationButton(destination:LandmarkDetail(landmark: landmark)){
                    LandmarkRow(landmark: landmark)
                }
                
            }.navigationBarTitle(Text("landmarks"))
        }
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"].identified(by: \.self)){ deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName)).previewDisplayName(deviceName)
        }
    }
}
#endif
