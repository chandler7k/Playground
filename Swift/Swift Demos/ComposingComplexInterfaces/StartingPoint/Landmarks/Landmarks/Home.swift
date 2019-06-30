//
//  Home.swift
//  Landmarks
//
//  Created by chandler7k on 2019/6/30.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct CategoryHome : View {
    var categoriezs : [String : [Landmark]] {
        .init(grouping: landmarkData, by: { $0.category.rawValue })
    }
    
    var featured: [Landmark]{
        landmarkData.filter{ $0.isFeatured }
    }
    
    var body: some View {
        NavigationView {
            List{
                FeaturedLandmarkView(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(categoriezs.keys.sorted().identified(by: \.self)) { key in
                    CategoryRow(categoryName: key, items: self.categoriezs[key]!)
                }
                    .listRowInsets(EdgeInsets())
                NavigationButton(destination: LandmarkList()){
                    Text("See All")
                }
            }
                .navigationBarTitle(Text("Features"))
                .navigationBarItems(trailing:
                    PresentationButton(destination: Text("User Profile")){
                        Image(systemName: "person.crop.circle")
                            .imageScale(.large)
                            .accessibility(label: Text("User Profile"))
                            .padding()
                    }
            )
        }
    }
}



struct FeaturedLandmarkView: View {
    var landmarks: [Landmark]
    var body: some View{
        landmarks[0].image(forSize: 205).resizable()
    }
}


#if DEBUG
struct Home_Previews : PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
#endif
