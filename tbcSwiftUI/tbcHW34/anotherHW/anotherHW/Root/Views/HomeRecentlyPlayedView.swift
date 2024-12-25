//
//  HomeRecentlyPlayedView.swift
//  anotherHW
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct HomeRecentlyPlayedView: View {
    let HORIZONTAL_SPACING: CGFloat = 24
    let artists: [Artist]
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("არტისტები").foregroundColor(.text_header)
                .modifier(FontModifier(.bold, size: 20))
                .padding(.leading, HORIZONTAL_SPACING)
                .padding()
            NavigationStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(artists, id: \.self) { artist in
                            NavigationLink {
                                ArtistMusicList(musicList: artist.musics, artist: artist)
                            } label: {
                                MusicDiscView(artistName: artist.name, coverImage: Image(artist.image))
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}


