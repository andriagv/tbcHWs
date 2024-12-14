//
//  TimerViewModel.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.

import Foundation
import Combine

final class TimerViewModel: ObservableObject {
    @Published var timers: [TimerModel] = [] {
        didSet {
            persistenceManager.saveTimers(timers)
        }
    }
    
    private let timerManager = TimerManager()
    private let persistenceManager: PersistenceService
    private var cancellables: Set<AnyCancellable> = []
    
    init(persistenceManager: PersistenceService = PersistenceManager()) {
        self.persistenceManager = persistenceManager
        loadTimers()
        bindToManager()
    }
    
    func addTimer(name: String, hours: Int, minutes: Int, seconds: Int) {
        let timer = TimerModel(
            id: UUID(),
            name: name,
            hours: hours,
            minutes: minutes,
            seconds: seconds,
            initialHours: hours,
            initialMinutes: minutes,
            initialSeconds: seconds,
            isActive: false,
            durationInSeconds: 0,
            date: Date()
        )
        timerManager.addTimer(timer)
    }
    
    func deleteTimer(id: UUID) {
        timerManager.removeTimer(id: id)
    }
    
    func startTimer(id: UUID) {
        timerManager.startTimer(id: id)
    }
    
    func stopTimer(id: UUID) {
        timerManager.stopTimer(id: id)
    }
    
    func resetTimer(id: UUID) {
        timerManager.resetTimer(id: id)
    }
    
    private func bindToManager() {
        timerManager.$timers
            .receive(on: RunLoop.main)
            .sink { [weak self] timers in
                self?.timers = timers
            }
            .store(in: &cancellables)
    }
    
    private func loadTimers() {
        let savedTimers = persistenceManager.loadTimers()
        savedTimers.forEach { timer in
            timerManager.addTimer(timer)
        }
    }
    
    func formatDuration(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, remainingSeconds)
    }
}
