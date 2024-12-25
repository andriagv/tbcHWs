//
//  MusicRowView.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct MusicRowView: View {
    let music: Music
    
    var body: some View {
        HStack {
            Image(music.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(4)
            VStack(alignment: .leading) {
                Text(music.name)
                    .font(.headline)
                Text(music.artist)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
