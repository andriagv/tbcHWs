//
//  MadeForView.swift
//  anotherHW
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct MadeForView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image.profile_pic.resizable().scaledToFill()
                .frame(width: 114, height: 140).cornerRadius(16)
            VStack(alignment: .leading, spacing: 8) {
                Text("აქ რამეს დავწერ :დ").foregroundColor(.text_primary)
                    .modifier(FontModifier(.bold, size: 18))
                Text("მოკლედ ზევით არის ყველა მუსიკა გაერთიანებული, ხოლო ქვევით არი არტისტების მიხედვით დალაგებული")
                    .foregroundColor(.text_primary_f1)
                    .modifier(FontModifier(.regular, size: 13))
            }.padding(.leading, 12)
            Spacer()
        }
        .padding(12).background(Color.primary_color)
        .cornerRadius(24).modifier(NeuShadow())
    }
}
