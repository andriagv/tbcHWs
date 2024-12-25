//
//  MusicDetailsViewModel.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//


import SwiftUI
import AVKit

class MusicDetailsViewModel: ObservableObject {
    @Published var isPlaying = false
    @Published var progress: Float = 0.0
    
    private var audioPlayer: AVAudioPlayer?
    private var timer: Timer?
    let music: Music
    
    init(music: Music) {
        self.music = music
        setupAudio()
    }
    
    private func setupAudio() {
        if let url = Bundle.main.url(forResource: music.audioFileName, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Failed to initialize AVAudioPlayer: \(error.localizedDescription)")
            }
        } else {
            print("Audio file not found: \(music.audioFileName).mp3")
        }
    }
    
    func playPauseAudio() {
        guard let player = audioPlayer else { return }
        
        if isPlaying {
            player.pause()
            stopTimer()
        } else {
            player.play()
            startTimer()
        }
        isPlaying.toggle()
    }
    
    func restartAudio() {
        guard let player = audioPlayer else { return }
        player.currentTime = 0
        stopTimer()
        progress = 0.0
        if isPlaying {
            player.play()
            startTimer()
        }
    }
    
    func stopAudio() {
        audioPlayer?.stop()
        stopTimer()
        progress = 0.0
        isPlaying = false
    }
    
    private func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self, let player = self.audioPlayer else { return }
            self.progress = Float(player.currentTime / player.duration)
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
