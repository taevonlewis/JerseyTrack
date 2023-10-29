//
//  Signup.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI
import Firebase

struct Signup: View {
    @State private var model: AuthViewModel
    @FocusState private var focusedField: FocusedField?
    @State private var isLoginButtonPressed: Bool = false
    @Binding var showLogin: ActiveView
    
    var isLogin: Binding<Bool> {
        Binding(
        get: { self.showLogin == .login },
        set: { newValue in self.showLogin = newValue ? .login : .signup }
        )
    }
    
    public init(model: AuthViewModel, showLogin: Binding<ActiveView>) {
        self._model = State(initialValue: model)
        self._showLogin = showLogin
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.primaryColor, .secondaryColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                    
                    VStack {
                        Image("jerseytrack-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .padding(.top, 50)
                        
                        Text("Get Started!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                            .padding([.top, .bottom], 20)
                        
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
                            JTGradientButton(title: "Sign Up", action: model.registerUser)
                                .navigationDestination(isPresented: isLogin, destination: { Login(model: model, showSignup: $showLogin) })
                            Button(action: {}, label: {
                                HStack {
                                    Text("Already have an account?")
                                        .foregroundStyle(.black)
                                    Text("Login")
                                        .foregroundStyle(.black)
                                        .fontWeight(.bold)
                                        .underline()
                                        .scaleEffect(isLoginButtonPressed ? 0.9 : 1.0)
                                }
                                .padding(.bottom, 70)
                                .onTapGesture {
                                    showLogin = .login
                                }
                                .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                                    withAnimation {
                                        self.isLoginButtonPressed = pressing
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
    SignupPreviewWrapper(activeView: .signup)
}

struct SignupPreviewWrapper: View {
    @State var activeView: ActiveView
    
    var body: some View {
        Signup(model: AuthViewModel(), showLogin: $activeView)
    }
}
