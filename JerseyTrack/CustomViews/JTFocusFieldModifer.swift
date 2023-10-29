//
//  JTFocusFieldModifer.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI

struct JTFocusFieldModifer: ViewModifier {
    var isFocused: Bool
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isFocused ? Color.secondaryColor : .clear, lineWidth: 2)
            )
            .foregroundColor(.black)
    }
}
