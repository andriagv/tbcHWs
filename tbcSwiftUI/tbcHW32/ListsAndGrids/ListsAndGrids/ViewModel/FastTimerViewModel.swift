//
//  FastTimerViewModel.swift
//  ListsAndGrids
//
//  Created by Apple on 15.12.24.
//

import Foundation

final class FastTimerViewModel: ObservableObject {
    
    @Published var fastTimersArray: [TimerModel] = [
        TimerModel(
            id: UUID(),
            name: "დილის რუტინა",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: true,
            durationInSeconds: 1800,
            date: Date()
        ),
        TimerModel(
            id: UUID(),
            name: "ვარჯიში",
            hours: 1,
            minutes: 0,
            seconds: 0,
            initialHours: 1,
            initialMinutes: 0,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 3600,
            date: Date()
        ),
        TimerModel(
            id: UUID(),
            name: "სამზარეულო",
            hours: 0,
            minutes: 45,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 45,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 2700,
            date: Date()
        ),
        TimerModel(
            id: UUID(),
            name: "ტაიმერი სწავლისთვის",
            hours: 2,
            minutes: 0,
            seconds: 0,
            initialHours: 2,
            initialMinutes: 0,
            initialSeconds: 0,
            isActive: true,
            durationInSeconds: 7200,
            date: Date()
        ),
        TimerModel(
            id: UUID(),
            name: "დასვენება",
            hours: 0,
            minutes: 0,
            seconds: 23,
            initialHours: 0,
            initialMinutes: 0,
            initialSeconds: 23,
            isActive: false,
            durationInSeconds: 900,
            date: Date()
        ),
        TimerModel(
            id: UUID(),
            name: "შეხვედრა",
            hours: 1,
            minutes: 30,
            seconds: 0,
            initialHours: 1,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: true,
            durationInSeconds: 5400,
            date: Date()
        ),
        TimerModel(
            id: UUID(),
            name: "ფიქრი",
            hours: 0,
            minutes: 20,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 20,
            initialSeconds: 0,
            isActive: true,
            durationInSeconds: 1200,
            date: Date()
        ),
        TimerModel(
            id: UUID(),
            name: "მუსიკის მოსმენა",
            hours: 1,
            minutes: 15,
            seconds: 0,
            initialHours: 1,
            initialMinutes: 15,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 4500,
            date: Date()
        ),
        TimerModel(
            id: UUID(),
            name: "ფილმის ყურება",
            hours: 2,
            minutes: 30,
            seconds: 0,
            initialHours: 2,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 9000,
            date: Date()
        )
    ]
    
    func formattedTime(for timer: TimerModel) -> String {
        if timer.hours > 0 {
            String(format: "%02d:%02d:%02d", timer.hours, timer.minutes, timer.seconds)
        } else if timer.minutes > 0 {
            String(format: "%02d:%02d", timer.minutes, timer.seconds)
        } else {
            String(format: "%02d", timer.seconds)
        }
    }
}

