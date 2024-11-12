//
//  latestNewsViewModel.swift
//  newsApp
//
//  Created by Apple on 30.10.24.
//

import Foundation
import UIKit
import NetworkingModule
import DateFormatterService

final class LatestNewsViewModel {
    
    private let networkManager: NetworkProtocol
    private let formatter: DateFormatting
    
    var articles: [NewsArticle] = []
    
    var onDataUpdated: (() -> Void)?
    
    init(networkManager: NetworkProtocol = NetworkManager(), formatter: DateFormatting = DateFormatterService()) {
        self.networkManager = networkManager
        self.formatter = formatter
    }
    
    func fetchNews() {
        networkManager.fetchNews { [weak self] articles in
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
        articles.count
    }
    
    func article(at index: Int) -> NewsArticle {
        articles[index]
    }
}
