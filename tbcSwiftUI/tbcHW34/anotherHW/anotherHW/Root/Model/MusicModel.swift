//
//  MusicModel.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//

import Foundation

struct Music: Identifiable, Codable, Hashable {
    let id: UUID
    let imageName: String
    let name: String
    let artist: String
    let audioFileName: String
    var isFavorite: Bool = false 
    
    init(id: UUID = UUID(), imageName: String, name: String, artist: String, audioFileName: String, isFavorite: Bool = false) {
        self.id = id
        self.imageName = imageName
        self.name = name
        self.artist = artist
        self.audioFileName = audioFileName
        self.isFavorite = isFavorite
    }
}

