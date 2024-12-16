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
            
            
            if !timers[index].activiteData.isEmpty {
                if timers[index].activiteData[0].day != formattedDatee(Date(), "dd MMM yyyy") {
                    timers[index].activiteData.insert(
                        ActiviteData(
                            time: [Time(startTime: formattedDatee(Date(), "HH:mm"), sessionDuration: "0")],
                            day: formattedDatee(Date(), "dd MMM yyyy")
                        ),
                        at: 0
                    )
                } else {
                    timers[index].activiteData[0].time.insert(
                        Time(startTime: formattedDatee(Date(), "HH:mm"), sessionDuration: "00:00:00"), at: 0)
                }
            } else {
                timers[index].activiteData.insert(
                    ActiviteData(
                        time: [Time(startTime: formattedDatee(Date(), "HH:mm"), sessionDuration: "00:00:00")],
                        day: formattedDatee(Date(), "dd MMM yyyy")
                    ),
                    at: 0
                )
            }
            startGlobalTimer()
            timers[index].durationInSeconds = 0
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
    
    private func formattedDatee(_ date: Date,_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ka_GE")
        return formatter.string(from: date)
    }
}
