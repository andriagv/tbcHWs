//
//  TimerManagerTests.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.
//


import XCTest
@testable import DataFlow

final class TimerManagerTests: XCTestCase {
    private var timerManager: TimerManager!
    
    override func setUp() {
        super.setUp()
        timerManager = TimerManager()
    }

    override func tearDown() {
        timerManager = nil
        super.tearDown()
    }
    
    func testAddTimer() {
        let timer = TimerModel(id: UUID(), name: "Test Timer", hours: 0, minutes: 1, seconds: 30, initialHours: 0, initialMinutes: 1, initialSeconds: 30, isActive: false)
        
        timerManager.addTimer(timer)
        XCTAssertEqual(timerManager.timers.count, 1)
        XCTAssertEqual(timerManager.timers.first?.name, "Test Timer")
    }
    
    func testRemoveTimer() {
        let timerID = UUID()
        let timer = TimerModel(id: timerID, name: "Test Timer", hours: 0, minutes: 1, seconds: 30, initialHours: 0, initialMinutes: 1, initialSeconds: 30, isActive: false)
        
        timerManager.addTimer(timer)
        timerManager.removeTimer(id: timerID)
        
        XCTAssertTrue(timerManager.timers.isEmpty)
    }
    
    func testStartAndStopTimer() {
        let timerID = UUID()
        let timer = TimerModel(id: timerID, name: "Test Timer", hours: 0, minutes: 1, seconds: 0, initialHours: 0, initialMinutes: 1, initialSeconds: 0, isActive: false)
        
        timerManager.addTimer(timer)
        timerManager.startTimer(id: timerID)
        XCTAssertTrue(timerManager.timers.first?.isActive ?? false)
        
        timerManager.stopTimer(id: timerID)
        XCTAssertFalse(timerManager.timers.first?.isActive ?? false)
    }
}
