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
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
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
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
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
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
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
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
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
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
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
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
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
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
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
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
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
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "დახვეწა",
            hours: 1,
            minutes: 10,
            seconds: 0,
            initialHours: 1,
            initialMinutes: 10,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 4200,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "პიკის საათი",
            hours: 0,
            minutes: 45,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 45,
            initialSeconds: 0,
            isActive: true,
            durationInSeconds: 2700,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "მარიაჟი",
            hours: 0,
            minutes: 15,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 15,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 900,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "კარანტინი",
            hours: 3,
            minutes: 30,
            seconds: 0,
            initialHours: 3,
            initialMinutes: 30,
            initialSeconds: 0,
            isActive: true,
            durationInSeconds: 12600,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "თვალსაზრისის შეცვლა",
            hours: 2,
            minutes: 45,
            seconds: 0,
            initialHours: 2,
            initialMinutes: 45,
            initialSeconds: 0,
            isActive: false,
            durationInSeconds: 9900,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "მახსოვრობა",
            hours: 0,
            minutes: 50,
            seconds: 0,
            initialHours: 0,
            initialMinutes: 50,
            initialSeconds: 0,
            isActive: true,
            durationInSeconds: 3000,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "სტუდენტი",
            hours: 1,
            minutes: 5,
            seconds: 0,
            initialHours: 1,
            initialMinutes: 5,
            initialSeconds: 0,
            isActive: true,
            durationInSeconds: 3900,
            activiteData: [ActiviteData(time: [Time(startTime: "12:32", sessionDuration: "12"), Time(startTime: "12:32", sessionDuration: "12")], day: "13 დეკ 2024")]
        ),
        TimerModel(
            id: UUID(),
            name: "გემრიელობა",
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

