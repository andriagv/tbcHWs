//
//  QuizManager.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//

import Foundation

class QuizManager: ObservableObject {
    @Published var mockQuestion: [QuestionModel] = []

    init() {
        if let data = readLocalFile(forName: "quizzes") {
            do {
                let decoder = JSONDecoder()
                mockQuestion = try decoder.decode([QuestionModel].self, from: data)
            } catch {
                print("დეკოდინგის ერორი \(error)")
            }
        } else {
            mockQuestion = [
                QuestionModel(id: UUID(), type: .anime, emoji: "sdsdfsdfsdfsdfwerderff", answers: ["1", "2", "3"], correctAnswer: "2", hint: "ds", isAnswered: false, scores: 0),
            ]
        }
    }

    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json") {
                return try Data(contentsOf: URL(fileURLWithPath: bundlePath))
            }
        } catch {
            print("ფაილი არაჩანს \(error)")
        }
        return nil
    }
}
