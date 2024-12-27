//
//  QuestionModel.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//

import Foundation

struct QuestionModel: Codable, Hashable {
    let type: Type
    let emoji: String
    let answers: [String]
    let correctAnswer: String
    let hint: String
}

enum Type: String, Codable {
    case film = "film"
    case book = "book"
    case anime = "anime"
}



