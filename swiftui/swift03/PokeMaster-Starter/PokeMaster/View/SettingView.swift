//
//  SettingView.swift
//  PokeMaster
//
//  Created by 邹奂霖 on 2020/5/23.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI
class Settings: ObservableObject {
    enum AccountBehavior: CaseIterable {
        case register,login
    }
    
    enum Sorting: CaseIterable {
        case id,name,color,favorite
    }
    
    @Published var accountBehavior = AccountBehavior.login
    @Published var email = ""
    @Published var password = ""
    @Published var veifyPassword = ""
    @Published var showEnglishName = true
    @Published var sorting = Sorting.id
    @Published var shadowFavoriteOnly = false
}

struct SettingView: View {
    @ObservedObject var setting = Settings()
    var body: some View{
        Form{
            accountSection
            optionSection
            actionSection
        }
    }
    
    var accountSection: some View{
        Section(header: Text("账户")) {
            Picker(selection: $setting.accountBehavior, label: Text("")) {
                ForEach(Settings.AccountBehavior.allCases,id: \.self){
                    Text($0.text)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            TextField("电子邮箱",text: $setting.email)
            SecureField("密码",text: $setting.password)
            
            if setting.accountBehavior == .register{
                SecureField("确认密码",text: $setting.password)
            }
            Button(setting.accountBehavior.text){
                print("登录/注册")
            }
        }
    }
    
    var optionSection: some View{
        Section(header: Text("选项")) {
            Toggle(isOn: $setting.showEnglishName) {
                Text("显示英文名")
            }
            
            Picker(selection: $setting.sorting, label: Text("排序方式")) {
                ForEach(Settings.Sorting.allCases,id: \.self){
                    Text($0.text)
                }
            }
            Toggle(isOn: $setting.shadowFavoriteOnly) {
                Text("只展示收藏")
            }
        }
    }
    
    var actionSection: some View{
        Section{
//            Button{
//                Text("清空缓存")
//                    .foregroundColor(Color.red)
//                print("clean cache")
//            }
            Button(action:{
                print("clean cache")
            }){
                Text("清空缓存")
                    .foregroundColor(Color.red)
            }
        }
    }
}


extension Settings.Sorting{
    var text: String{
        switch self {
        case .id: return "ID"
        case .name: return "名字"
        case .color: return "颜色"
        case .favorite: return "最爱"
        }
    }
}

extension Settings.AccountBehavior{
    var text: String{
        switch self {
        case .register:
            return "注册"
        case .login:
            return "登录"
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
