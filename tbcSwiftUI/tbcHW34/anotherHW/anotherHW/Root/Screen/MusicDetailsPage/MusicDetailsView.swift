//
//  MusicDetailsView.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//

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
    @State var isFavorite = false
    
    init(music: Music) {
        _viewModel = StateObject(wrappedValue: MusicDetailsViewModel(music: music))
    }
    
    var body: some View {
        ZStack {
            // ფონის გრადიენტი
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.purple.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
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
                        Image.options.resizable().frame(width: 16, height: 16)
                            .padding(12)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(20)
                            .modifier(NeuShadow())
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
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                
                Text(viewModel.music.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(viewModel.music.artist)
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.7))
                
                HStack {
                    Text(viewModel.currentTimeFormatted)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                        .padding()
                    
                    ProgressBar(progress: $viewModel.progress)
                        .frame(height: 3)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                        .gesture(DragGesture()
                            .onChanged { value in
                                let width = UIScreen.main.bounds.width - 2 * HORIZONTAL_SPACING
                                let newProgress = min(max(0, Float(value.location.x / width)), 1)
                                viewModel.updateProgress(newProgress)
                            }
                        )
                        
                    
                    Text(viewModel.durationFormatted)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                        .padding()
                }
                .padding()
                
                HStack(spacing: 10) {
                    Spacer()
                    Button(action: { }) {
                        Image.next
                            .resizable()
                            .frame(width: 18, height: 18)
                            .rotationEffect(Angle(degrees: 180))
                            .padding(24)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(40)
                            .modifier(NeuShadow())
                    }
                    .padding(.trailing)
                    
                    Button(action: viewModel.playPauseAudio) {
                        Image(systemName: viewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .padding(24)
                            .background(Color.blue.opacity(0.4))
                            .cornerRadius(80)
                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    
                    Button(action: viewModel.restartAudio) {
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .padding(24)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(80)
                            .modifier(NeuShadow())
                    }
                    
                    Button(action: { }) {
                        Image.next.resizable().frame(width: 18, height: 18)
                            .padding(24)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(40)
                            .modifier(NeuShadow())
                    }
                    Spacer()
                }
                .padding()
                
                
                Spacer()
            }
            .padding()
        }
        .onDisappear {
            viewModel.stopAudio()
        }
    }
}

#Preview {
    MusicDetailsView(music: Music(imageName: "EminemGodzillaImage", name: "Godzilla", artist: "Eminem", audioFileName: "EminemGodzilla"))
}

