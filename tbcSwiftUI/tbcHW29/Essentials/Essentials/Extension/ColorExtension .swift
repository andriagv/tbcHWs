//
//  ColorExtension .swift
//  SwiftUIBasics
//
//  Created by Apple on 06.12.24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        let a = hex.count > 7 ? Double((rgb >> 24) & 0xFF) / 255.0 : 1.0
        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
    
    static let darkGray = Color(hex: "#6E6464")
    static let textFieldGray = Color(hex: "#DBDBDB")
    static let overlayGray = Color(hex: "#13161F0D")
    static let forestGreen = Color(hex: "#3B775B")
}
