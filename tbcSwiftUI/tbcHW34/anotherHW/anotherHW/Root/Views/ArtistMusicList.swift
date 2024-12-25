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
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.blue.opacity(0.4)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack(alignment: .center) {
                    Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                        Image.close.resizable()
                            .frame(width: 20, height: 20)
                            .padding(8)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(20)
                            .modifier(NeuShadow())
                    }
                    Spacer()
                    Button(action: { }) {
                        Image.options.resizable()
                            .frame(width: 16, height: 16)
                            .padding(12)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(20)
                            .modifier(NeuShadow())
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
                                        .background(
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(Color.white.opacity(0.1))
                                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                                        )
                                        .padding(8)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .navigationTitle(artist.name)
                .foregroundColor(.white)
            }
        }
    }
}
