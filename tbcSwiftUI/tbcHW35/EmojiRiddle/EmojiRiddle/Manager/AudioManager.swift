//
//  AudioManager.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//

import Foundation
import AVFoundation

final class AudioManager {
    
    var player: AVAudioPlayer?
    
    func playSound(name: String) {
        if let soundURL = Bundle.main.url(forResource: name, withExtension: "mp3") {
            do {
                let player = try AVAudioPlayer(contentsOf: soundURL)
                player.prepareToPlay()
                player.play()
                self.player = player
            } catch {
                print("ხმის ფაილის გაშვება ვერ მოხერხდა: \(error)")
            }
        } else {
            print("happy.mp3 ფაილი ვერ მოიძებნა!")
        }
    }
}
