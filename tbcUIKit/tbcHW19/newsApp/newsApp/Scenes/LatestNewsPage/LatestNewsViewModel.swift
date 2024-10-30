//
//  latestNewsViewModel.swift
//  newsApp
//
//  Created by Apple on 30.10.24.
//

import Foundation
import UIKit


final class LatestNewsViewModel {
    
    private let newsService = NewsService()
    var articles: [NewsArticle] = []
    
    var onDataUpdated: (() -> Void)?
    
    var configure1: (() -> Void)?
    
    func fetchNews() {
        newsService.fetchNews { [weak self] articles in
            self?.articles = articles
            DispatchQueue.main.async {
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
