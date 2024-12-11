//
//  TimerModel.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.
//


import Foundation

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
}

