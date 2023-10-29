//
//  ErrorMessage.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI

enum ErrorMessage: String, Error {
    case invalidEmail = "Invalid email"
    case invalidPassword = "Invalid password"
    
    var description: String {
        return self.rawValue
    }
}
