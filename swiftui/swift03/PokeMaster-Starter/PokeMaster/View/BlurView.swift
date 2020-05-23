//
//  BlurView.swift
//  PokeMaster
//
//  Created by 邹奂霖 on 2020/5/23.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blueView = UIVisualEffectView(effect: blurEffect)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(blueView)
        NSLayoutConstraint.activate([
            blueView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blueView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view;
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

extension View{
    func blurBackground(style: UIBlurEffect.Style) -> some View {
        ZStack{
            BlurView(style: style)
            self
        }
    }
}
