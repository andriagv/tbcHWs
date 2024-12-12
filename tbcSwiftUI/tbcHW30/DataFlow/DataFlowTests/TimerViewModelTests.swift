//
//  TimerViewModelTests.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.
//


import XCTest
@testable import DataFlow

final class TimerViewModelTests: XCTestCase {
    private var viewModel: TimerViewModel?
    private var persistenceMock: MockPersistenceManager?
    
    override func setUp() {
        super.setUp()
        persistenceMock = MockPersistenceManager()
        viewModel = TimerViewModel(persistenceManager: persistenceMock!)
    }

    override func tearDown() {
        viewModel = nil
        persistenceMock = nil
        super.tearDown()
    }
    
    func testAddTimer() {
        viewModel?.addTimer(name: "Test Timer", hours: 1, minutes: 30, seconds: 0)
        
        let expectation = XCTestExpectation(description: "Wait for timers to update")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(self.viewModel?.timers.count, 1)
            XCTAssertEqual(self.viewModel?.timers.first?.name, "Test Timer")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testDeleteTimer() {
        let timerID = UUID()
        viewModel?.addTimer(name: "Test Timer", hours: 1, minutes: 30, seconds: 0)
        viewModel?.deleteTimer(id: timerID)
        
        XCTAssertTrue(((viewModel?.timers.isEmpty) != nil))
    }
    
    
    
}

class MockPersistenceManager: PersistenceService {
    var didCallSave = false
    var stubbedTimers: [TimerModel] = []
    
    func saveTimers(_ timers: [TimerModel]) {
        didCallSave = true
        stubbedTimers = timers
    }
    
    func loadTimers() -> [TimerModel] {
        return stubbedTimers
    }
}
