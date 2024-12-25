//
//  PlaylistView.swift
//  anotherHW
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct PlaylistView: View {
    
    let name: String, artistName: String, coverImage: Image
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            coverImage
                .resizable()
                .scaledToFill()
                .frame(width: 114, height: 88).cornerRadius(16)
            Text(name)
                .foregroundColor(.text_primary)
                .modifier(FontModifier(.bold, size: 16))
                .padding(.top, 12)
                .padding(.bottom, 6)
            Text(artistName)
                .foregroundColor(.text_primary_f1)
                .modifier(FontModifier(.regular, size: 12))
                .padding(.bottom, 8)
        }
        .padding(12).background(Color.primary_color)
        .cornerRadius(24).modifier(NeuShadow())
    }
}

#Preview {
    PlaylistView(name: "dsfd", artistName: "sdfd", coverImage: Image("sdf"))
}
