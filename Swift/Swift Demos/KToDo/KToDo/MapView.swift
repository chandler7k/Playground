//
//  MapView.swift
//  KToDo
//
//  Created by chandler7k on 2019/6/8.
//  Copyright © 2019 chandler7k. All rights reserved.
//

import SwiftUI
import MapKit
struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView{
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        let coordinate = CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868)
        let soan = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: soan)
        view.setRegion(region, animated: true)
    }
}

#if DEBUG
struct MapView_Previews : PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
#endif
