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

//    func updateAnswerStatus(for question: QuestionModel) {
//        if let index = selectQuestions.firstIndex(where: { $0 == question }) {
//            selectQuestions[index].isAnswered = true
//        }
//    }
//
//    func calculateTotalScore() {
//        totalScore = selectQuestions.reduce(0) { result, question in
//            result + (question.isAnswered ? (question.correctAnswer == "2" ? 1.0 : 0.5) : 0.0)
//        }
//    }
//
//    func checkGameCompletion() {
//        let allAnswered = selectQuestions.allSatisfy { $0.isAnswered }
//        if allAnswered {
//            calculateTotalScore()
//            isGameFinished = true
//            print("თამაში დასრულდა. საერთო ქულები: \(totalScore)")
//        } else {
//            print("გარკვეული კითხვები ჯერ კიდევ უპასუხოა.")
//        }
//    }
}
