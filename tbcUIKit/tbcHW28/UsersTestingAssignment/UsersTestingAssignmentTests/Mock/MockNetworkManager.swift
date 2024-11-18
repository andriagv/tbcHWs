//
//  MockNetworkManager.swift
//  UsersTestingAssignment
//
//  Created by Apple on 18.11.24.
//

import Foundation
@testable import UsersTestingAssignment

final class MockNetworkManager: NetworkingService {
    
    func fetchUsers(withLimit limit: Int, completionHandler: @escaping ([User]) -> Void) {
        guard let data = User.jsonMock.data(using: .utf8) else {
            completionHandler([])
            return
        }
        
        do {
            let userList = try JSONDecoder().decode(UserList.self, from: data)
            
            let limitedResults = Array(userList.results.prefix(limit))
            completionHandler(limitedResults)
        } catch {
            print(error.localizedDescription)
            completionHandler([])
        }
    }
}


