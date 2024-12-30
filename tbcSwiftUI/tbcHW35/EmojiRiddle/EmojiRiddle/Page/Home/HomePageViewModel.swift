//
//  HomePageViewModel.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//

import Foundation

final class HomePageViewModel {
    let manager = QuizManager()

    func returnSelectQuestions(type: Type) -> [QuestionModel] {
        return manager.mockQuestion.filter { $0.type == type }
    }
}
