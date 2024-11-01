//
//  MoviewManager.swift
//
//  Created by Nika Topuria on 20.10.21.
//

import Foundation

final class MovieManager {
    func fetchMovieList(with url: String, completion: @escaping ((MovieList) -> Void)) {
        let quaryURL = URL(string: url)
        let session = URLSession.shared
        if let url = quaryURL {
            session.dataTask(with: url) { Data, Response, Error in
                if let data = Data {
                    do {
                        let movieList = try JSONDecoder().decode(MovieList.self, from: data)
                        completion(movieList)
                    } catch {
                        if let error = Error {
                            print (error.localizedDescription)
                        }
                    }
                } else {
                    if let error = Error {
                        print (error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func constructSearch(with quary: String) -> String {
        let quaryPrefix = "https://api.themoviedb.org/3/search/movie?api_key=b688d2e3d40e21d185f1dd90d122a568&language=en-US&query="
        let quarySuffix = "&page=1&include_adult=false"
        let finalQuary = "\(quaryPrefix)\(quary)\(quarySuffix)"
        return finalQuary
    }
}
