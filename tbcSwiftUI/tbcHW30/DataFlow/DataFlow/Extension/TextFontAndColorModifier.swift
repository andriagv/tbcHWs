//
//  TextFontAndColorModifier.swift
//  Essentials
//
//  Created by Apple on 08.12.24.
//

import SwiftUI

struct TextFontAndColorModifier: ViewModifier {
    let textColor: Color
    let textSize: CGFloat
    let font: String?

    func body(content: Content) -> some View {
        content
            .font(font != nil ? Font.custom(font!, size: textSize) : .system(size: textSize))
            .foregroundColor(textColor)
    }
}

extension View {
    func makeTextStyle(color: Color, size: CGFloat, font: String?) -> some View {
        self.modifier(TextFontAndColorModifier(textColor: color, textSize: size, font: font))
    }
}
