//
//  JTErrorMessageView.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI

struct JTErrorMessageView: View {
    var message: String
    
    var body: some View {
        Text(message)
            .foregroundStyle(.red)
            .font(.caption)
    }
}

#Preview {
    JTErrorMessageView(message: ErrorMessage.invalidEmail.rawValue)
}
