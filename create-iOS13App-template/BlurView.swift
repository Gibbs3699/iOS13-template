//
//  BlurView.swift
//  create-iOS13App-template
//
//  Created by admin on 21/12/2564 BE.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    typealias UIViewType = UIView
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: .systemMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint
            .activate([blurView.widthAnchor.constraint(equalTo: view.widthAnchor), blurView.heightAnchor.constraint(equalTo: view.widthAnchor)])
                      
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
//
    }

}
