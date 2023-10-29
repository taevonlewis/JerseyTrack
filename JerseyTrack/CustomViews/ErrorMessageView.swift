//
//  ErrorMessageView.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI

struct ErrorMessageView: View {
    var message: String
    
    var body: some View {
        Text(message)
            .foregroundStyle(.red)
            .font(.caption)
    }
}

#Preview {
    ErrorMessageView(message: ErrorMessage.invalidEmail.rawValue)
}
