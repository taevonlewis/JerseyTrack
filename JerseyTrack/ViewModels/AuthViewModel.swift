//
//  AuthViewModel.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI
import FirebaseAuth

@Observable
class AuthViewModel {
    private var email: String = ""
    private var password: String = ""
    private var emailErrorMessage: ErrorMessage?
    private var passwordErrorMessage: ErrorMessage?
    
    func setEmail(_ newEmail: String) {
        self.email = newEmail
        validateEmail()
    }
    
    func setPassword(_ newPassword: String) {
        self.password = newPassword
        validatePassword()
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    func getPassword() -> String {
        return self.password
    }
    
    func getEmailErrorMessage() -> ErrorMessage? {
        return emailErrorMessage
    }
    
    func getPasswordErrorMessage() -> ErrorMessage? {
        return passwordErrorMessage
    }
    
    func registerUser() {
        register()
    }
    
    func loginUser() {
        login()
    }
    
    private func register() {
        validateEmail()
        validatePassword()
        
        if emailErrorMessage == nil && passwordErrorMessage == nil {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error != nil {
                    print(error!.localizedDescription)
                }
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
    
    private func validateEmail() {
        emailErrorMessage = !email.isValidEmail ? .invalidEmail : nil
    }
    
    private func validatePassword() {
        passwordErrorMessage = !password.isValidPassword ? .invalidPassword : nil
    }
}
