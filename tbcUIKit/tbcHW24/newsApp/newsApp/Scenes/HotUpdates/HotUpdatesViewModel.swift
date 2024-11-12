//
//  HotUpdatesViewModel.swift
//  newsApp
//
//  Created by Apple on 30.10.24.
//

import Foundation
import UIKit
import DateFormatterService

final class HotUpdatesViewModel {
    private let article: NewsArticle
    private let formatter: DateFormatting
    
    init(article: NewsArticle,formatter: DateFormatting = DateFormatterService()) {
        self.article = article
        self.formatter = formatter
    }
    
    var title: String {
        article.title
    }
    
    var author: String {
        "Published by \(article.author)"
    }
    
    var formattedDate: String {
        formatter.formatDate(article.publishedAt)
    }
    
    var description: String {
        article.description
    }
    
    var imageUrl: URL? {
        URL(string: article.imageUrl)
    }
}



