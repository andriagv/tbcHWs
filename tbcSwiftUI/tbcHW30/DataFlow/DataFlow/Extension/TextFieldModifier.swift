//
//  TextFieldModifier.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.
//


import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 10)
            .background(Color.textFieldBackgroundColor)
            .cornerRadius(8)
            .foregroundColor(.white)
            .font(.system(size: 16))
            .multilineTextAlignment(.center)
    }
}

extension View {
    
    func makeTextFieldStyle() -> some View {
        self.modifier(TextFieldModifier())
    }
}

