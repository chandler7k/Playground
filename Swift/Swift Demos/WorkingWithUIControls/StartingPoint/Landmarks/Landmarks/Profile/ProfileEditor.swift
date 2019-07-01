//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by chandler7k on 2019/7/1.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEditor : View {
    @Binding var profile: Profile
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField($profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications){
                Text("Enable Notifications")
            }
            
            VStack(alignment: .leading, spacing: 20){
                SegmentedControl(selection: $profile.seasonalPhoto){
                    ForEach(Profile.Season.allCases.identified(by: \.self)){ season in
                        Text(season.rawValue).tag(season)
                    }
                }
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 20){
                Text("Goal Date").bold()
                
                DatePicker($profile.goalDate, minimumDate: Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate), maximumDate: Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate), displayedComponents: .date)
                
            }
            .padding(.top)
        }
    }
}

#if DEBUG
struct ProfileEditor_Previews : PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
#endif
