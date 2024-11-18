//
//  MockNetworkManagerTests.swift
//  UsersTestingAssignment
//
//  Created by Apple on 18.11.24.
//


import XCTest
@testable import UsersTestingAssignment

final class NetworkManagerTests: XCTestCase {
    
    var mockNetworkManager: MockNetworkManager?
    
    override func setUpWithError() throws {
        mockNetworkManager = MockNetworkManager()
    }
    
    override func tearDownWithError() throws {
        mockNetworkManager = nil
    }
    
    func testFetchUsersReturnsCorrectData() throws {
        mockNetworkManager?.fetchUsers(withLimit: 1) { users in
            XCTAssertEqual(users.count, 1)
            XCTAssertEqual(users.first?.name.first, "Christian")
            XCTAssertEqual(users.first?.email, "christian.nielsen@example.com")
        }
    }
    
    func testFetchUsersIsNotNil() throws {
        mockNetworkManager?.fetchUsers(withLimit: 1) { users in
            XCTAssertNotNil(users)
            XCTAssertNotNil(users.first?.name)
        }
    }
    
    func testUserListIsNotEmpty() throws {
        mockNetworkManager?.fetchUsers(withLimit: 1) { users in
            XCTAssertFalse(users.isEmpty)
        }
    }
    
    func testFetchUsersHandlesLimitProperly() throws {
        mockNetworkManager?.fetchUsers(withLimit: 2) { users in
            XCTAssertEqual(users.count, 1)
        }
    }
    
    func testEmailContainsAtSymbol() throws {
        mockNetworkManager?.fetchUsers(withLimit: 1) { users in
            if let email = users.first?.email {
                XCTAssertTrue(email.contains("@"))
            }
        }
    }
    
    func testValidMockDataConversion() throws {
        let jsonString = User.jsonMock
        if let  data = jsonString.data(using: .utf8) {
            XCTAssertNotNil(data)
        }
    }
    
    func testPerformanceFetchUsers() throws {
        mockNetworkManager?.fetchUsers(withLimit: 100) { users in
            XCTAssertGreaterThan(users.count, 0)
        }
    }
}
