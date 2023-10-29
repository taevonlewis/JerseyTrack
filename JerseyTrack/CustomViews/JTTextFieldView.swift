//
//  JTTextFieldView.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI

struct JTTextFieldView: View {
    var placeholder: Text
    var isSecure: Bool
    var thisField: FocusedField
    var image: Image?
    @Binding var text: String
    @FocusState var focusedField: FocusedField?
    
    
    var body: some View {
        HStack {
            Group {
                if let image = image {
                    image
                } else {
                    Spacer()
                }
            }
            .frame(width: 20)
            .padding(5)
            
            ZStack(alignment: .leading) {
                if isSecure {
                    SecureField("", text: $text)
                        .modifier(JTFocusFieldModifer(isFocused: thisField ==  focusedField))
                        .textFieldStyle(.plain)
                        .textInputAutocapitalization(.never)
                        .focused($focusedField, equals: thisField)
                        
                } else {
                    TextField("", text: $text)
                        .modifier(JTFocusFieldModifer(isFocused: thisField == focusedField))
                        .textFieldStyle(.plain)
                        .textInputAutocapitalization(.never)
                        .focused($focusedField, equals: thisField)
                }
                placeholder
                    .fontWeight(.medium)
                    .foregroundStyle(text.isEmpty ? .black.opacity(0.7) : .clear)
                    .padding([.leading, .trailing], 10)
                    .allowsHitTesting(false)
            }
        }
    }
}

#Preview {
    JTTextFieldView(placeholder: Text("Email"), isSecure: false, thisField: .email, image: Image(systemName: "envelope"), text: .constant(""))
}
