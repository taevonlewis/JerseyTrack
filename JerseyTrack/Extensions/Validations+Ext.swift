//
//  Validations+Ext.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI

extension String {
    var isValidEmail: Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
            return emailTest.evaluate(with: self)
        }
        
    var isValidPassword: Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$&*]).{6,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: self)
    }
}
