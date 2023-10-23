//
//  Signup.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI

struct Signup: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .textFieldStyle(.plain)
            SecureField("Password", text: $password)
                .textFieldStyle(.plain)
            Button("Sign Up", role: .none) {}
        }
        
    }
}

#Preview {
    Signup()
}
