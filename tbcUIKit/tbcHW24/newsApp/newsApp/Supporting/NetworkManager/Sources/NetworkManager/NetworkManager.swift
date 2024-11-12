// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

class NetworkManager {
    @MainActor static let shared = NetworkManager()
    private let session = URLSession.shared

    private init() {}
    
    func fetchData(from url: URL, completion: @escaping @Sendable (Result<Data, Error>) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                return
            }
            
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
            }
        }
        task.resume()
    }
}
