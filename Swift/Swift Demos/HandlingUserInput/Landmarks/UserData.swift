//
//  UserData.swift
//  Landmarks
//
//  Created by chandler7k on 2019/6/9.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI
import Combine
final class UserData: BindableObject{
    let didChange = PassthroughSubject<UserData, Never>()
    
    var showFavoriteOnly = false{
        didSet{
            didChange.send(self)
        }
    }
    
    var landmarks = landmarkData{
        didSet{
            didChange.send(self)
        }
    }
    
    
}
