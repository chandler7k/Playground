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
    init(style: UIBlurEffect.Style) {
        print("init")
        self.style = style
    }
    func makeUIView(context: Context) -> some UIView {
        print("make UIView")
        let view = UIView(frame: .zero)
//        view.backgroundColor = .clear
//        let blurEffect = UIBlurEffect(style: style)
//        let blueView = UIVisualEffectView(effect: blurEffect)
//        blueView.translatesAutoresizingMaskIntoConstraints = false
//        blueView.tag = 111
//        view.addSubview(blueView)
//        NSLayoutConstraint.activate([
//            blueView.heightAnchor.constraint(equalTo: view.heightAnchor),
//            blueView.widthAnchor.constraint(equalTo: view.widthAnchor)
//        ])
        return view;
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("update UIView")
        let blurEffect = UIBlurEffect(style: style)
        let blueView = UIVisualEffectView(effect: blurEffect)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        uiView.subviews.forEach { view in
            if view.tag == 111{
                view.removeFromSuperview()
            }
        }
        blueView.tag = 111
        uiView.addSubview(blueView)
        NSLayoutConstraint.activate([
            blueView.heightAnchor.constraint(equalTo: uiView.heightAnchor),
            blueView.widthAnchor.constraint(equalTo: uiView.widthAnchor)
        ])
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
