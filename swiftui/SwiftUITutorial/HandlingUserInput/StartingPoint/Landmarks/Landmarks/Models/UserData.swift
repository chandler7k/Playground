//
//  UserData.swift
//  Landmarks
//
//  Created by 邹奂霖 on 2020/8/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Combine

final class UserData: ObservableObject{
    @Published var showFavoriteOnly = false
    @Published var landmarks = landmarkData
}
