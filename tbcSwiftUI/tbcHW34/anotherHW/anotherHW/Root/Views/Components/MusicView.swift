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
        VStack(spacing: 8) {
            Image(music.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 120)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 4)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(music.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(music.artist)
                        .font(.subheadline)
                        .foregroundColor(.purple.opacity(0.8))
                }
                Spacer()
            }
            .padding(.horizontal, 8)
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 3)
    }
}

#Preview {
    MusicView(music: Music(imageName: "ndsfdf", name: "sdv", artist: "sdvs", audioFileName: "csdcf"))
}
