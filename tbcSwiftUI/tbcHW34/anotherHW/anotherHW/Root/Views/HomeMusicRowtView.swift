//
//  HomeMusicRowtView.swift
//  anotherHW
//
//  Created by Apple on 25.12.24.
//


import SwiftUI

struct HomeMusicRowtView: View {
    @State var musicList: [Music]
    let HORIZONTAL_SPACING: CGFloat = 24
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("ყველა მუსიკა").foregroundColor(.text_header)
                    .modifier(FontModifier(.bold, size: 20))
                    .padding(.leading, HORIZONTAL_SPACING)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach($musicList) { $music in
                            NavigationLink {
                                MusicDetailsView(music: music)
                            } label: {
                                ZStack {
                                    PlaylistView(name: music.name, artistName: music.artist, coverImage: Image(music.imageName))
                                }
                            }
                        }
                        .padding(.top, 6)
                        .padding(.bottom, 40)
                    }
                    .padding(.horizontal, HORIZONTAL_SPACING)
                }
            }
            .padding(.top, 36)
        }
    }
}

