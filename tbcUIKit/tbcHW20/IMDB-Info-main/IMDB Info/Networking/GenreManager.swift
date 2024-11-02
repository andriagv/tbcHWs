//
//  GenreManager.swift
//  IMDB Info
//
//  Created by Nika Topuria on 26.10.21.
//

import Foundation

final class GenreManager {
    static func fetchGenreList(with url: String, completion: @escaping ((GenreList) -> Void)) {
        let quaryURL = URL(string: url)
        let session = URLSession.shared
        if let url = quaryURL {
            session.dataTask(with: url) { Data, Response, Error in
                if let data = Data {
                    do {
                        let genreList = try JSONDecoder().decode(GenreList.self, from: data)
                        completion(genreList)
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
            }.resume()
        }
    }
}
