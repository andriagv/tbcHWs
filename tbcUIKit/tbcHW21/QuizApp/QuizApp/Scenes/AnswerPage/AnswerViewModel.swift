//
//  AnswerViewModel.swift
//  QuizApp
//
//  Created by Apple on 03.11.24.
//
import Foundation

final class AnswerViewModel {
    let question: QuestionModel
    private let userDefaultsKey: String
    var correctAnswersCount: Int = 0
    var incorrectAnswersCount: Int = 0
    
    init(question: QuestionModel) {
        self.question = question
        self.userDefaultsKey = "userAnswer_\(question.question)"
    }
    
    func saveAnswer(_ answer: String) {
        UserDefaults.standard.set(answer, forKey: userDefaultsKey)
        
        if answer == question.answer {
            correctAnswersCount += 1
        } else {
            incorrectAnswersCount += 1
        }
    }
    
    func retrieveSavedAnswer() -> String? {
        UserDefaults.standard.string(forKey: userDefaultsKey)
    }
}
