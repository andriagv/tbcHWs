//
//  NetworkManager.swift
//  MultithreadingAndConcurrency
//
//  Created by Nika Topuria on 06.11.24.
//

import Foundation
import UIKit

final class NetworkManager: NetworkManaging {
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        print("\nStarting download for \(url) on thread \(Thread.current)")
        let startTime = Date()
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let endTime = Date()
            print("\nFinished download for \(url) in \(endTime.timeIntervalSince(startTime)) seconds on thread \(Thread.current)")
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
