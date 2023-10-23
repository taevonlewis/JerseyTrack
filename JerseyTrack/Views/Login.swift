//
//  Login.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI
import Firebase

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .textFieldStyle(.plain)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .textFieldStyle(.plain)
                .textInputAutocapitalization(.never)
            Button {
                login()
            } label: {
                Text("Login")
            }

        }
    }
    
    private func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            print("success")
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    Login()
}
