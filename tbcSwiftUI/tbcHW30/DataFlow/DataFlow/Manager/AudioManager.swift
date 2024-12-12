//
//  AudioManager.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.
//


import AVFoundation

final class AudioManager {
    private var audioURL: URL?
    private var player: AVPlayer?
    
    init() {
        if let validURL = URL(string: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3") {
            audioURL = validURL
        } else {
            print("Invalid URL")
            return
        }
        
        if let validURL = audioURL {
            player = AVPlayer(url: validURL)
        }
    }
    
    func playCompletionSound() {
        guard let player = player else {
            print("Player not initialized")
            return
        }
        
        player.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.player?.pause()
        }
    }
}

