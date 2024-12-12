//
//  PersistenceManagerTests.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.
//


import XCTest
@testable import DataFlow

final class PersistenceManagerTests: XCTestCase {
    private var persistenceManager: PersistenceManager!
    private let userDefaultsKey = "savedTimers"
    
    override func setUp() {
        super.setUp()
        persistenceManager = PersistenceManager()
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }

    override func tearDown() {
        persistenceManager = nil
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
        super.tearDown()
    }
    
    func testSaveAndLoadTimers() {
        let timer = TimerModel(id: UUID(), name: "Test Timer", hours: 0, minutes: 1, seconds: 30, initialHours: 0, initialMinutes: 1, initialSeconds: 30, isActive: false)
        
        persistenceManager.saveTimers([timer])
        let loadedTimers = persistenceManager.loadTimers()
        
        XCTAssertEqual(loadedTimers.count, 1)
        XCTAssertEqual(loadedTimers.first?.name, "Test Timer")
    }
    
    func testLoadEmptyTimers() {
        let loadedTimers = persistenceManager.loadTimers()
        XCTAssertTrue(loadedTimers.isEmpty)
    }
}
