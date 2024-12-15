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
    
    static let cardBackgroundColor = Color(hex: "#2C2C2C")
    static let textFieldBackgroundColor = Color(hex: "#3A3A3C")
    static let textFieldTintColor = Color(hex: "#757575")
    static let startButtonColor = Color(hex: "#34C759")
    static let resetButtonColor = Color(hex: "#FF3B30")
    static let stopButtonColor = Color(hex: "#FF9500")
    static let addButtonColor = Color(hex: "#007AFF")
}
