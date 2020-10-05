//
//  WatchMapView.swift
//  WatchLandmarks Extension
//
//  Created by devlinlin on 2020/10/6.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI
import MapKit
struct WatchMapView: WKInterfaceObjectRepresentable {
    var landmark: Landmark
    
//    func makeWKInterfaceObject(context: Context) -> some WKInterfaceObject {
//        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
//        let region = MKCoordinateRegion(center: landmark.locationCoordinate, span: span)
//        return Map(coordinateRegion: region)
//    }
//
//    func updateWKInterfaceObject(_ wkInterfaceObject: WKInterfaceObjectType, context: Context) {
//
//    }
    func makeWKInterfaceObject(context: WKInterfaceObjectRepresentableContext<WatchMapView>) -> WKInterfaceMap {
        return WKInterfaceMap()
    }


    func updateWKInterfaceObject(_ map: WKInterfaceMap, context: WKInterfaceObjectRepresentableContext<WatchMapView>) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: landmark.locationCoordinate, span: span)
        map.setRegion(region)
    }
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
}

struct WatchMapView_Previews: PreviewProvider {
    static var previews: some View {
        WatchMapView(landmark: UserData().landmarks[0])
    }
}
