//
//  MusicDetailsView.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

fileprivate let HORIZONTAL_SPACING: CGFloat = 24

struct MusicDetailsView: View {
    @StateObject private var viewModel: MusicDetailsViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isFavorite =  false
    
    init(music: Music) {
        _viewModel = StateObject(wrappedValue: MusicDetailsViewModel(music: music))
    }
    
    var body: some View {
        VStack(spacing: 20) {
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
            .navigationBarBackButtonHidden(true) 
            .padding(.horizontal, HORIZONTAL_SPACING)
            .padding(.top, 12)
            Spacer()
            Image(viewModel.music.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(12)
            Text(viewModel.music.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(viewModel.music.artist)
                .font(.title2)
                .foregroundColor(.secondary)
            
            HStack {
                ProgressBar(progress: $viewModel.progress)
                    .frame(height: 10)
                    .padding()
                
                Button(action: {
                    self.isFavorite.toggle()
                }) {
                    Label("", systemImage: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .primary)
                }
                .padding()
            }
            
            HStack {
                Button(action: {  }) {
                    Image.next
                        .resizable()
                        .frame(width: 18, height: 18)
                        .rotationEffect(Angle(degrees: 180))
                        .padding(24)
                        .background(Color.primary_color)
                        .cornerRadius(40)
                        .modifier(NeuShadow())
                }
                Button(action: viewModel.playPauseAudio) {
                    Image(systemName: viewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(24)
                        .background(Color.primary_color)
                        .cornerRadius(80)
                }
                Button(action: viewModel.restartAudio) {
                    Image(systemName: "arrow.counterclockwise.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(24)
                        .background(Color.primary_color)
                        .cornerRadius(80)
                        .modifier(NeuShadow())
                }
                Button(action: {  }) {
                    Image.next.resizable().frame(width: 18, height: 18)
                        .padding(24)
                        .background(Color.primary_color)
                        .cornerRadius(40).modifier(NeuShadow())
                }
            }
            Spacer()
        }
        .padding()
        .onDisappear {
            viewModel.stopAudio()
        }
    }
}

#Preview {
    MusicDetailsView(music: Music(imageName: "EminemGodzillaImage", name: "Godzilla", artist: "Eminem", audioFileName: "EminemGodzilla"))
}

