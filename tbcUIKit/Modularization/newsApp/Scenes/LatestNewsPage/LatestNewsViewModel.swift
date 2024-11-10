//
//  latestNewsViewModel.swift
//  newsApp
//
//  Created by Apple on 30.10.24.
//

import Foundation
import UIKit

import NetworkingModule

final class LatestNewsViewModel {
    
    private let newsService = NetworkManager()
    var articles: [NewsArticle] = []
    
    var onDataUpdated: (() -> Void)?
    
    func fetchNews() {
        newsService.fetchNews { [weak self] articles in
            let newsDataModels = articles.map { article in
                NewsArticle(
                    title: article.title,
                    author: article.author,
                    publishedAt: article.publishedAt,
                    imageUrl: article.imageUrl,
                    description: article.description
                )
            }
            self?.articles = newsDataModels
            DispatchQueue.main.async { [weak self] in
                self?.onDataUpdated?()
            }
        }
    }
    
    func numberOfArticles() -> Int {
        return articles.count
    }
    
    func article(at index: Int) -> NewsArticle {
        return articles[index]
    }
}
