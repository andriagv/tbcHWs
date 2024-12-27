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
    @Published var isAnswered = false
    @Published var showHintAlert = false
    @Published var attemptsLeft = 2

    init(question: QuestionModel) {
        self.question = question
    }

    func selectAnswer(_ answer: String) {
        guard !isAnswered && attemptsLeft > 0 else { return }
        
        selectedAnswer = answer

        if isCorrectAnswer(answer) {
            isAnswered = true
        } else {
            attemptsLeft -= 1
            if attemptsLeft > 0 {
                showHintAlert = true 
            }
        }
    }

    func isCorrectAnswer(_ answer: String) -> Bool {
        return answer == question.correctAnswer
    }
}


