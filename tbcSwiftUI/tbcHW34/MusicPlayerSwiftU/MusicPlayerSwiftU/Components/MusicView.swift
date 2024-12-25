//
//  MusicView.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct MusicView: View {
    let music: Music
    
    var body: some View {
        VStack {
            Image(music.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 120)
                .cornerRadius(8)
            HStack {
                VStack {
                    Text(music.name)
                        .font(.headline)
                    Text(music.artist)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

#Preview {
    MusicView(music: Music(imageName: "ndsfdf", name: "sdv", artist: "sdvs", audioFileName: "csdcf")
)
}
