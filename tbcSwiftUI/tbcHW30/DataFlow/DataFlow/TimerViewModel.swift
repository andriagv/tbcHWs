//
//  TimerViewModel.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.

import SwiftUI
import Combine
import AVFoundation

final class TimerViewModel: ObservableObject {
    @Published var timers: [TimerModel] = [] {
        didSet {
            saveTimers()
        }
    }
    
    private var timer: Timer?
    private let userDefaultsKey = "savedTimers"
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
        
        loadTimers()
    }
    
    func startTimer(id: UUID) {
        stopAllTimers()
        if let index = timers.firstIndex(where: { $0.id == id }) {
            timers[index].isActive = true
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                self?.updateTimer(at: index)
            }
        }
    }
    
    func stopTimer(id: UUID) {
        timers.firstIndex(where: { $0.id == id }).map { timers[$0].isActive = false }
        timer?.invalidate()
    }
    
    func resetTimer(id: UUID) {
        
        if let index = timers.firstIndex(where: { $0.id == id }) {
            
            timer?.invalidate()
            timers[index].isActive = false
            
            timers[index].hours = timers[index].initialHours
            timers[index].minutes = timers[index].initialMinutes
            timers[index].seconds = timers[index].initialSeconds
        }
    }
    
    func deleteTimer(id: UUID) {
        timers.removeAll { $0.id == id }
    }
    
    func addTimer(name: String, hours: Int, minutes: Int, seconds: Int) {
        let newTimer = TimerModel(
            id: UUID(),
            name: name,
            hours: hours,
            minutes: minutes,
            seconds: seconds,
            initialHours: hours,
            initialMinutes: minutes,
            initialSeconds: seconds,
            isActive: false
        )
        timers.append(newTimer)
    }
    
    private func stopAllTimers() {
        timers.indices.forEach { timers[$0].isActive = false }
        timer?.invalidate()
    }
    
    private func updateTimer(at index: Int) {
        if timers[index].seconds > 0 {
            timers[index].seconds -= 1
        } else if timers[index].minutes > 0 {
            timers[index].minutes -= 1
            timers[index].seconds = 59
        } else if timers[index].hours > 0 {
            timers[index].hours -= 1
            timers[index].minutes = 59
            timers[index].seconds = 59
        } else {
            timerCompleted(for: index)
        }
    }
    
    private func timerCompleted(for index: Int) {
        timers[index].isActive = false
        playCompletionSound()
        timer?.invalidate()
    }
    
    // MARK: - უზერდიფოლტში ჩამატება
    private func saveTimers() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(timers) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    private func loadTimers() {
        let decoder = JSONDecoder()
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? decoder.decode([TimerModel].self, from: savedData) {
            timers = decoded
        }
    }
    
    // MARK: - Sound Playback
    private func playCompletionSound() {
        player?.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.player?.pause()
        }
    }
}
