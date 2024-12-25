//
//  MusicDetailsView.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct MusicDetailsView: View {
    @StateObject private var viewModel: MusicDetailsViewModel
    
    init(music: Music) {
        _viewModel = StateObject(wrappedValue: MusicDetailsViewModel(music: music))
    }
    
    var body: some View {
        VStack(spacing: 20) {
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
            
            ProgressBar(progress: $viewModel.progress)
                .frame(height: 10)
                .padding()
            
            HStack {
                Button(action: viewModel.playPauseAudio) {
                    Image(systemName: viewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding()
                }
                Button(action: viewModel.restartAudio) {
                    Image(systemName: "arrow.counterclockwise.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding()
                }
            }
        }
        .padding()
        .navigationTitle("Details")
        .onDisappear {
            viewModel.stopAudio()
        }
    }
}

#Preview {
    MusicDetailsView(music: Music(imageName: "EminemGodzillaImage", name: "Godzilla", artist: "Eminem", audioFileName: "EminemGodzilla"))
}

