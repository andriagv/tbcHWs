//
//  StatisticViewModel.swift
//  ListsAndGrids
//
//  Created by Apple on 16.12.24.
//



final class StatisticViewModel {
    
    func makeArray(timer: TimerModel) -> [String] {
        var array: [String] = []
        array.append(daylySessions(timer: timer))
        array.append(averageActiveTime(timer: timer))
        array.append(totalTime(timer: timer))
        return array
    }
    
    private func daylySessions(timer: TimerModel) -> String {
        if timer.activiteData.isEmpty {
            return "0 სესია"
        } else {
            return "\(timer.activiteData[0].time.count) სესია"
        }
    }
    
    private func formatTime(seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let remainingSeconds = seconds % 60
        
        var components: [String] = []
        if hours > 0 { components.append("\(hours) სთ") }
        if minutes > 0 { components.append("\(minutes) წთ") }
        if remainingSeconds > 0 || components.isEmpty { components.append("\(remainingSeconds) წმ") }
        return components.joined(separator: " ")
    }
    
    private func calculateTotalSeconds(timer: TimerModel) -> Int {
        return timer.activiteData.reduce(0) { total, activity in
            total + activity.time.reduce(0) { partialResult, time in
                let components = time.sessionDuration.split(separator: ":").compactMap { Int($0) }
                if components.count == 1 {
                    return partialResult + components[0]
                }

                if components.count == 3 {
                    let hours = components[0]
                    let minutes = components[1]
                    let seconds = components[2]
                    return partialResult + (hours * 3600 + minutes * 60 + seconds)
                }
                return partialResult
            }
        }
    }
    
    private func totalTime(timer: TimerModel) -> String {
        let totalSeconds = calculateTotalSeconds(timer: timer)
        return formatTime(seconds: totalSeconds)
    }
    
    private func averageActiveTime(timer: TimerModel) -> String {
        let totalSeconds = calculateTotalSeconds(timer: timer)
        let totalSessions = timer.activiteData.reduce(0) { $0 + $1.time.count }
        
        guard totalSessions > 0 else { return "0 წმ" }
        let averageSeconds = totalSeconds / totalSessions
        return formatTime(seconds: averageSeconds)
    }
}
