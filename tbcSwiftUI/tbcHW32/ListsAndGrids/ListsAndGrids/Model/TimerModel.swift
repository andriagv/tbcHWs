//
//  TimerModel.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.
//


import Foundation

struct TimerModel: Identifiable, Codable {
    let id: UUID
    var name: String
    var hours: Int
    var minutes: Int
    var seconds: Int
    var initialHours: Int
    var initialMinutes: Int
    var initialSeconds: Int
    var isActive: Bool
    var durationInSeconds: Int
    var activiteData: [ActiviteData]
    
    mutating func decrementTime() -> Bool {
        if seconds > 0 {
            seconds -= 1
        } else if minutes > 0 {
            minutes -= 1
            seconds = 59
        } else if hours > 0 {
            hours -= 1
            minutes = 59
            seconds = 59
        } else {
            return false
        }
        durationInSeconds += 1
        activiteData[0].time[0].sessionDuration = "\(durationInSeconds)"
        return true
    }
}

