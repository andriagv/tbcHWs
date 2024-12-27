//
//  QuestionListViewModel.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//

import Foundation

final class QuestionListViewModel: ObservableObject {
    @Published var selectQuestions: [QuestionModel]
    @Published var totalScore: Double = 0.0
    @Published var isGameFinished = false

    init(selectQuestions: [QuestionModel]) {
        self.selectQuestions = selectQuestions
    }

    func calculateTotalScore() {
        totalScore = selectQuestions.reduce(0) { result, question in
            result + (question.scores)
        }
    }

    func checkGameCompletion() {
        let allAnswered = selectQuestions.allSatisfy { $0.isAnswered }
        if allAnswered {
            calculateTotalScore()
            isGameFinished = true
        }
    }
    
    func choseView() -> Bool {
        if totalScore >= Double(selectQuestions.count * 8 / 10) {
            true
        } else {
            false
        }
    }
}
