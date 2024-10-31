//
//  NewsService.swift
//  newsApp
//
//  Created by Apple on 30.10.24.
//

import Foundation

class NewsService {
    private let apiKey = "2e41c513815843378fa95bace03e6dff"
    private let baseURL = "https://newsapi.org/v2/everything?q=bitcoin"
    
    func fetchNews(completion: @escaping ([NewsArticle]) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching news: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let articlesArray = jsonResponse["articles"] as? [[String: Any]] {
                    let articles = articlesArray.compactMap { articleData -> NewsArticle? in
                        let title = articleData["title"] as? String ?? "No Title"
                        let author = articleData["author"] as? String ?? "Unknown"
                        let publishedAt = articleData["publishedAt"] as? String ?? "No Date"
                        let imageUrl = articleData["urlToImage"] as? String ?? ""
                        let description = articleData["description"] as? String ?? "No Title"
                        return NewsArticle(title: title, author: author, publishedAt: publishedAt, imageUrl: imageUrl , description: description)
                    }
                    completion(articles)
                }
            } catch {
                print("JSON parsing error: \(error)")
            }
        }.resume()
    }
}
