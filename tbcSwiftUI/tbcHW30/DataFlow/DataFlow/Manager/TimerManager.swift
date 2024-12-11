//
//  TimerManager.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.
//


import Foundation
import Combine

final class TimerManager: ObservableObject {
    @Published private(set) var timers: [TimerModel] = []
    private var timer: Timer?
    private let audioManager = AudioManager()
    
    func addTimer(_ timer: TimerModel) {
        timers.append(timer)
    }
    
    func removeTimer(id: UUID) {
        timers.removeAll { $0.id == id }
    }
    
    func startTimer(id: UUID) {
        if let index = timers.firstIndex(where: { $0.id == id }) {
            timers[index].isActive = true
            startGlobalTimer()
        }
    }
    
    func stopTimer(id: UUID) {
        if let index = timers.firstIndex(where: { $0.id == id }) {
            timers[index].isActive = false
        }
        if !timers.contains(where: { $0.isActive }) {
            stopGlobalTimer()
        }
    }
    
    func resetTimer(id: UUID) {
        if let index = timers.firstIndex(where: { $0.id == id }) {
            var timer = timers[index]
            timer.hours = timer.initialHours
            timer.minutes = timer.initialMinutes
            timer.seconds = timer.initialSeconds
            timer.isActive = false
            timers[index] = timer
        }
        stopGlobalTimer()
    }
    
    private func startGlobalTimer() {
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateActiveTimers()
        }
    }
    
    private func stopGlobalTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateActiveTimers() {
        for index in timers.indices where timers[index].isActive {
            if !timers[index].decrementTime() {
                audioManager.playCompletionSound()
                timers[index].isActive = false
            }
        }
    }
}
