//
//  SettingRootView.swift
//  PokeMaster
//
//  Created by 邹奂霖 on 2020/5/23.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI
struct SettingRootView: View {
    var body: some View{
        NavigationView{
            SettingView().navigationBarTitle("设置")
        }
    }
}



struct SettingRootView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRootView()
    }
}
