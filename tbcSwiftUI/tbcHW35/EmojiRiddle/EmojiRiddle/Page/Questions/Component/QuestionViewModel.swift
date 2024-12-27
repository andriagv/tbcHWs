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

    init(question: QuestionModel) {
        self.question = question
    }

    func selectAnswer(_ answer: String) {
        guard !isAnswered else { return }
        selectedAnswer = answer
        isAnswered = true
    }

    func isCorrectAnswer(_ answer: String) -> Bool {
        return answer == question.correctAnswer
    }
}