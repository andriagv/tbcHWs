// QuizViewModel.swift
// QuizApp
//
// Created by Apple on 03.11.24.

import Foundation

final class QuizViewModel {
    private var questions: [QuestionModel] = []
    
    func loadQuestions(completion: @escaping () -> Void) {
        let questionManager = QuestionManager()
        questionManager.fetchQuestions { [weak self] fetchedQuestions in
            self?.questions = fetchedQuestions
            completion()
        }
    }
    
    func numberOfQuestions() -> Int {
        return questions.count
    }
    
    func question(at index: Int) -> QuestionModel {
        return questions[index]
    }
    
    func resetAllAnswers() {
        for question in questions {
            let userDefaultsKey = "userAnswer_\(question.question)"
            UserDefaults.standard.removeObject(forKey: userDefaultsKey)
            
            let correctCountKey = "correctAnswersCount"
            let incorrectCountKey = "incorrectAnswersCount"
            UserDefaults.standard.removeObject(forKey: correctCountKey)
            UserDefaults.standard.removeObject(forKey: incorrectCountKey)
        }
    }
}
