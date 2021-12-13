//
//  Modifiers.swift
//  create-iOS13App-template
//
//  Created by admin on 13/12/2564 BE.
//

import SwiftUI

struct ShadowModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1)
    }
}

struct FontModifiers: ViewModifier {
    var style: Font.TextStyle = .body
    
    func body(content: Content) -> some View {
        content
            .font(.system(.body, design: .rounded))
    }
}
