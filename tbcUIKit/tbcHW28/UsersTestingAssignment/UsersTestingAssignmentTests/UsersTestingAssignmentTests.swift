//
//  UsersTestingAssignmentTests.swift
//  UsersTestingAssignmentTests
//
//  Created by Apple on 17.11.24.
//

import XCTest
@testable import UsersTestingAssignment

final class UsersTestingAssignmentTests: XCTestCase {
    
    var user: User?
    var userViewModel: UserViewModel?
    
    override func setUpWithError() throws {
        user = User(
            gender: "male",
            name: Name(title: "Mr", first: "Andria", last: "Gv"),
            email: "andriaGV@tbcacademy.edu.com",
            picture: Picture(
                large: "",
                medium: "",
                thumbnail: "https://thumbnail.jpg"
            ),
            nat: "",
            cell: "(123)-456-7890",
            phone: "(098)-765-4321"
        )
        
        if let user = user {
            userViewModel = UserViewModel(user: user)
        }
    }
    
    override func tearDownWithError() throws {
        user = nil
        userViewModel = nil
    }
    
    func testFullName() throws {
        XCTAssertEqual(userViewModel?.fullName, "Mr Andria Gv")
    }
    
    func testContactNumber() throws {
        XCTAssertEqual(userViewModel?.contactNumber, "(123)-456-7890 / (098)-765-4321")
    }
    
    func testThumbnailImageUrl() throws {
        XCTAssertEqual(userViewModel?.thumbnailImageUrl, URL(string: "https://thumbnail.jpg"))
    }
    
    func testEmail() throws {
        XCTAssertEqual(userViewModel?.email, "andriaGV@tbcacademy.edu.com")
    }
}
