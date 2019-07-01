//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by chandler7k on 2019/7/1.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary : View {
    var profile: Profile
    
    static var goalFormatter: DateFormatter  {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d,yyyy"
        return formatter
    }
    
    var body: some View {
        List{
            Text(profile.username).bold().font(.title)
            Text("Notifications: \(self.profile.prefersNotifications ? "On": "Off" )")
            
            Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
            
            Text("Goal Date: \(self.profile.goalDate, formatter: Self.goalFormatter)")
            
            VStack(alignment: .leading) {
                Text("Completed Badges")
                    .font(.headline)
                ScrollView{
                    HStack{
                        HikeBadge(name: "first hike")
                        
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                }
                    .frame(height: 140)
            }
            
            VStack(alignment: .leading) {
                Text("Recent Hiking")
                    .font(.headline)
                HikeView(hike: hikeData[0])
            }
        }
    }
}

#if DEBUG
struct ProfileSummary_Previews : PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
#endif
