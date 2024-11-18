//
//  NetworkManager.swift
//  UsersTesting
//
//  Created by Nino Godziashvili on 15.11.24.
//

import UIKit

final class NetworkManager: NSObject {
    static let sharedInstance = NetworkManager()
    
    var users: [User] = []
    private let baseUrl = "https://randomuser.me/api/"
    
    private override init() {
        super.init()
    }
    
    func fetchUsers(withLimit limit: Int = 1, completionHandler: @escaping ([User]) -> Void) {
        guard let url = URL(string: baseUrl + "?results=\(limit)") else {
            print("Invalid URL")
            return
        }
        
        print("Fetching data for URL: \(url)")
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching users: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data {
                do {
                    let userList = try JSONDecoder().decode(UserList.self, from: data)
                    completionHandler(userList.results)
                } catch {
                    print("Failed to decode data: \(error)")
                }
            }
        }
        task.resume()
    }
}

