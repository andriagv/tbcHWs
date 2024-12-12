//
//  PersistenceManager.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.
//

import Foundation

protocol PersistenceService {
    func saveTimers(_ timers: [TimerModel])
    func loadTimers() -> [TimerModel]
}

class PersistenceManager: PersistenceService {
    private let userDefaultsKey = "savedTimers"
    
    func saveTimers(_ timers: [TimerModel]) {
        if let encodedData = try? JSONEncoder().encode(timers) {
            UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
        }
    }

    func loadTimers() -> [TimerModel] {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey),
              let timers = try? JSONDecoder().decode([TimerModel].self, from: data) else {
            return []
        }
        return timers
    }

}

