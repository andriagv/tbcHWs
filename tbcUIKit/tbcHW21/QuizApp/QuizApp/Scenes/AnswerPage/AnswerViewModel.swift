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
    private let correctCountKey = "correctAnswersCount"
    private let incorrectCountKey = "incorrectAnswersCount"
    
    var correctAnswersCount: Int {
        get {
            return UserDefaults.standard.integer(forKey: correctCountKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: correctCountKey)
        }
    }
    
    var incorrectAnswersCount: Int {
        get {
            return UserDefaults.standard.integer(forKey: incorrectCountKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: incorrectCountKey)
        }
    }
    
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
        return UserDefaults.standard.string(forKey: userDefaultsKey)
    }
}

