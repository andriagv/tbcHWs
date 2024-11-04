//
//  QuestionManager.swift
//  QuizApp
//
//  Created by Apple on 03.11.24.
//

import Foundation

final class QuestionManager {
    func fetchQuestions(completion: @escaping ([QuestionModel]) -> Void) {
        guard let filePath = Bundle.main.path(forResource: "Questions", ofType: "json") else {
            print("file not found")
            completion([])
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            let questionResponse = try JSONDecoder().decode(QuestionResponse.self, from: data)
            let questions = questionResponse.results.compactMap { result -> QuestionModel? in
                guard result.incorrectAnswers.count == 3 else {
                    print("incorrect answers for : \(result.question)")
                    return nil
                }
                var answers = result.incorrectAnswers + [result.correctAnswer]
                answers.shuffle()
                
                return QuestionModel(
                    question: result.question,
                    A: answers[0],
                    B: answers[1],
                    C: answers[2],
                    D: answers[3],
                    answer: result.correctAnswer
                )
            }
            completion(questions)
        } catch {
            print("Failed: \(error)")
            completion([])
        }
    }
}
