//
//  PageControl.swift
//  Landmarks
//
//  Created by devlinlin on 2020/10/5.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI
import UIKit
struct PageControl: UIViewRepresentable {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl){
            control.currentPage = sender.currentPage
        }
    }
}

//struct PageControl_Previews: PreviewProvider {
//    static var previews: some View {
//        PageControl()
//    }
//}
