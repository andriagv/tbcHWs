//
//  QuestionListViewModel.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//

import Foundation


final class QuestionListViewModel: ObservableObject {
    @Published var questions: [QuestionViewModel]

    init(questions: [QuestionModel]) {
        self.questions = questions.map { QuestionViewModel(question: $0) }
    }
}
