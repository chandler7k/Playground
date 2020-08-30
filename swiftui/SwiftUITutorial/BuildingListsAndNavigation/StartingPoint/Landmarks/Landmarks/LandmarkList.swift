//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 邹奂霖 on 2020/8/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView{
            // list 可以接受容器，并传入里面的属性的.keypath
            // 或者让容器的element遵循 Identifiable 协议
            List(landmarkData){landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self){
            deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
//        LandmarkList()
//        .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}
