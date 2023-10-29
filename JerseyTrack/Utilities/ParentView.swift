//
//  ParentView.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI

struct ParentView: View {
    @State private var activeView: ActiveView = .signup
    
    var body: some View {
        NavigationStack {
            switch activeView {
            case .signup:
                Signup(model: AuthViewModel(), showLogin: $activeView)
            case .login:
                Login(model: AuthViewModel(), showSignup: $activeView)
            }
        }
    }
}
