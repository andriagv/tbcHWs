//
//  MusicDetailsViewModel.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//


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
    @Published var currentTimeFormatted: String = "0:00"
    @Published var durationFormatted: String = "0:00"
    
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
                if let duration = audioPlayer?.duration {
                    durationFormatted = formatTime(duration)
                }
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
    
    func updateProgress(_ newProgress: Float) {
        guard let player = audioPlayer else { return }
        progress = newProgress
        player.currentTime = TimeInterval(newProgress) * player.duration
        updateCurrentTime()
    }
    
    private func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self, let player = self.audioPlayer else { return }
            self.progress = Float(player.currentTime / player.duration)
            self.updateCurrentTime()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateCurrentTime() {
        guard let player = audioPlayer else { return }
        currentTimeFormatted = formatTime(player.currentTime)
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}
