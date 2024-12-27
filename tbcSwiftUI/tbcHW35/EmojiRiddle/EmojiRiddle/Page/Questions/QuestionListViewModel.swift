//
//  QuestionListViewModel.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//

import Foundation


final class QuestionListViewModel: ObservableObject {
    
    @Published var selectQuestions: [QuestionModel]
    
    
    init(selectQuestions: [QuestionModel]) {
        self.selectQuestions = selectQuestions
    }
}
