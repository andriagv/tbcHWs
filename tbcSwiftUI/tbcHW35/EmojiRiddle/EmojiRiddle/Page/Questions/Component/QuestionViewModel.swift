//
//  QuestionViewModel.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//


import SwiftUI

final class QuestionViewModel: ObservableObject {
    @Published var question: QuestionModel
    @Published var selectedAnswer: String? = nil
    @Published var showHintAlert = false
    @Published var attemptsLeft = 2
    @Published var score: Double = 0.0
    
    init(question: QuestionModel) {
        self.question = question
    }

    func selectAnswer(_ answer: String) {
        guard !question.isAnswered && attemptsLeft > 0 else { return }

        selectedAnswer = answer

        if isCorrectAnswer(answer) {
            question.isAnswered = true
            score = attemptsLeft == 2 ? 1.0 : 0.5
        } else {
            attemptsLeft -= 1
            if attemptsLeft > 0 {
                showHintAlert = true
            } else {
                question.isAnswered = true
                score = 0.0
            }
        }
    }

    func isCorrectAnswer(_ answer: String) -> Bool {
        return answer == question.correctAnswer
    }
}


