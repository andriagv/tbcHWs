//
//  HotUpdatesViewModel.swift
//  newsApp
//
//  Created by Apple on 30.10.24.
//

import Foundation
import UIKit

final class HotUpdatesViewModel {
    private let article: NewsArticle
    
    init(article: NewsArticle) {
        self.article = article
    }
    
    var title: String {
        article.title
    }
    
    var author: String {
        "Published by        \(article.author)"
    }
    
    var formattedDate: String {
        formatDate(article.publishedAt)
    }
    
    var description: String {
        article.description
    }
    
    var imageUrl: URL? {
        URL(string: article.imageUrl)
    }
    
    private func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "EEEE, d MMM yyyy"
            return dateFormatter.string(from: date)
        } else {
            return dateString
        }
    }
}



