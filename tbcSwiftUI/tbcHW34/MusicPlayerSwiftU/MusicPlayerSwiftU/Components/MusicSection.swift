//
//  MusicSection.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct MusicSection: View {
    let title: String
    let imageName: String
    @Binding var musicList: [Music]
    
    var body: some View {
        Section {
            ForEach($musicList) { $music in
                NavigationLink {
                    MusicDetailsView(music: music)
                } label: {
                    ZStack {
                        MusicView(music: music)
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                Button(action: {
                                    music.isFavorite.toggle()
                                }) {
                                    Label("Like", systemImage: music.isFavorite ? "heart.fill" : "heart")
                                        .foregroundColor(music.isFavorite ? .red : .primary)
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
        } header: {
            SectionHeader(title: title, imageName: imageName)
        }
    }
}

#Preview {
    ContentView()
}
