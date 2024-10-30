//
//  HotUpdatesViewModel.swift
//  newsApp
//
//  Created by Apple on 30.10.24.
//

import Foundation
import UIKit


import Foundation

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

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


