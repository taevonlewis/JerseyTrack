//
//  Login.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI
import Firebase

struct Login: View {
    @State private var model: AuthViewModel
    @FocusState private var focusedField: FocusedField?
    @State private var isSignupButtonPressed: Bool = false
    @Binding var showSignup: ActiveView
    
    var isSignup: Binding<Bool> {
        Binding(
        get: { self.showSignup == .signup },
        set: { newValue in self.showSignup = newValue ? .signup : .login }
        )
    }
    
    public init(model: AuthViewModel, showSignup: Binding<ActiveView>) {
        self._model = State(initialValue: model)
        self._showSignup = showSignup
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    LinearGradient(colors: [.secondaryColor, .primaryColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                    VStack {
                        Image("jerseytrack-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .padding(.top, 50)
                        Text("Welcome back!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                            .padding(.bottom, 20)
                        VStack(spacing: 25) {
                            JTTextFieldView(placeholder: Text("Email"), isSecure: false, thisField: .email, image: Image(systemName: "envelope"), text: 
                                    Binding(
                                        get: { self.model.getEmail() },
                                        set: { self.model.setEmail($0) }
                                    )
                                )
                                .focused($focusedField, equals: .email)
                                .overlay(
                                    VStack {
                                        Spacer()
                                        
                                        if let emailErrorMessage = model.getEmailErrorMessage() {
                                            ErrorMessageView(message: emailErrorMessage.description)
                                                .padding(.top, 70)
                                        }
                                    }
                                )
                            JTTextFieldView(placeholder: Text("Password"), isSecure: true, thisField: .password, image: Image(systemName: "lock"), text:
                                    Binding(
                                        get: { self.model.getPassword() },
                                        set: { self.model.setPassword($0) }
                                    )
                                )
                                .focused($focusedField, equals: .password)
                                .overlay(
                                    VStack {
                                        Spacer()
                                        
                                        if let passwordErrorMessage = model.getPasswordErrorMessage() {
                                            ErrorMessageView(message: passwordErrorMessage.description)
                                                .padding(.top, 70)
                                        }
                                    }
                                )
                                .padding(.bottom, 20)
                            JTGradientButton(title: "Login", action: model.loginUser)
                                .navigationDestination(isPresented: isSignup, destination: { Signup(model: model, showLogin: $showSignup) })
                            Button(action: {}, label: {
                                HStack {
                                    Text("Already have an account?")
                                        .foregroundStyle(.black)
                                    Text("Sign up ")
                                        .foregroundStyle(.black)
                                        .fontWeight(.bold)
                                        .underline()
                                        .scaleEffect(isSignupButtonPressed ? 0.9 : 1.0)
                                }
                                .padding(.bottom, 70)
                                .onTapGesture {
                                    showSignup = .signup
                                }
                                .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                                    withAnimation {
                                        self.isSignupButtonPressed = pressing
                                    }
                                }, perform: {})
                            })
                            .padding(.top, 120)
                        }
                        .padding([.leading, .trailing], geometry.size.width * 0.05)
                    }
                }
                .ignoresSafeArea()
            }
            .toolbar(.hidden)
        }
    }
}

#Preview {
    LoginPreviewWrapper(activeView: .login)
}

struct LoginPreviewWrapper: View {
    @State var activeView: ActiveView
    
    var body: some View {
        Login(model: AuthViewModel(), showSignup: $activeView)
    }
}
