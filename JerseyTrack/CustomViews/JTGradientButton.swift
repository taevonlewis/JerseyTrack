//
//  JTGradientButton.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI

struct JTGradientButton: View {
    var title: String
    var action: () -> Void
    @State private var isPressed: Bool = false
    
    var body: some View {
        Button(action: {
            isPressed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isPressed = false
                action()
            }
        }) {
            HStack {
                Text(title)
                Image(systemName: "arrow.right")
            }
            .foregroundStyle(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.primaryColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(isPressed ? 0.95 : 1)
            .animation(.easeIn, value: isPressed)
        }
    }
}

#Preview {
    JTGradientButton(title: "Button", action: {})
}
