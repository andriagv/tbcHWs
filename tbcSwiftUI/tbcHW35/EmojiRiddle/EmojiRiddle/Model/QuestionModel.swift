//
//  QuestionModel.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//

import Foundation

class QuestionModel: Codable {
    let id: UUID
    let type: Type
    let emoji: String
    let answers: [String]
    let correctAnswer: String
    let hint: String
    var isAnswered: Bool = false
    var scores: Double
    
    init(id: UUID, type: Type, emoji: String, answers: [String], correctAnswer: String, hint: String, isAnswered: Bool, scores: Double) {
        self.id = id
        self.type = type
        self.emoji = emoji
        self.answers = answers
        self.correctAnswer = correctAnswer
        self.hint = hint
        self.isAnswered = isAnswered
        self.scores = scores
    }
    
}

enum Type: String, Codable {
    case film = "film"
    case book = "book"
    case anime = "anime"
}



