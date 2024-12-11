//
//  ButtonModifier.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.
//


import SwiftUI

struct ButtonModifier: ViewModifier {
    let tintColor: Color?
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(backgroundColor)
            .cornerRadius(8)
            .foregroundColor(.white)
    }
}

extension View {
    func makeButtonStyle(tintColor: Color?, backgroundColor: Color) -> some View {
        self.modifier(ButtonModifier(tintColor: tintColor, backgroundColor: backgroundColor))
    }
}
