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
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "ვარჯიში",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "სამზარეულო",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "ტაიმერი სწავლისთვის",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        
        TimerModel(
            id: UUID(),
            name: "დასვენება",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "შეხვედრა",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "ფიქრი",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "მუსიკის მოსმენა",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "ფილმის ყურება",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "სირბილი",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "ცურვა",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "ტანვარჯიში",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "კარანტინი",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "სიცილი",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "მახსოვრობის ვარჯიში",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "სტუდენტი",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "მედიტაცია",
            hours: 0,
            minutes: 30,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 1800,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
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

