//
//  latestNewsViewModel.swift
//  newsApp
//
//  Created by Apple on 30.10.24.
//

import Foundation
import UIKit

struct News {
    var autorName: String
    var newsData: String
    var newsTitle: String
    var meore: String
    var newsImage: UIImage?
}

final class LatestNewsViewModel {
    
    var newsList = [
        News(autorName: "e", newsData: "e", newsTitle: "r", meore: "t"),
        News(autorName: "e", newsData: "e", newsTitle: "r", meore: "t"),
        News(autorName: "e", newsData: "e", newsTitle: "r", meore: "t"),
    ]


       var newsListcount: Int {
           newsList.count
       }
       
    func selectNews(at index: Int) -> News {
        newsList[index]
       }
}
