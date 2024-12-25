//
//  ArtistMusicList.swift
//  anotherHW
//
//  Created by Apple on 25.12.24.
//

import SwiftUI


struct ArtistMusicList: View {
    @Environment(\.presentationMode) var presentationMode
    @State var musicList: [Music]
    var artist: Artist
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                    Image.close.resizable()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(Color.primary_color)
                        .cornerRadius(20)
                        .modifier(NeuShadow())
                }
                Spacer()
                Button(action: {  }) {
                    Image.options.resizable().frame(width: 16, height: 16)
                        .padding(12).background(Color.primary_color)
                        .cornerRadius(20).modifier(NeuShadow())
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            Spacer()
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(musicList) { music in
                        NavigationLink {
                            MusicDetailsView(music: music)
                        } label: {
                            ZStack {
                                MusicView(music: music)
                            }
                        }
                    }
                    
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle(artist.name)
        }
    }
}
