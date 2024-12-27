//
//  QuestionListView.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//

import SwiftUI



struct QuestionListView: View {
    @ObservedObject var viewModel: QuestionListViewModel

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 30) {
                ForEach(viewModel.questions, id: \.question) {viewModel in
                    QuestionView(viewModel: viewModel)
                }
            }
        }
        .padding()
        .background(Color(uiColor: .systemBlue).gradient.opacity(0.5))
    }
}

#Preview {
    QuestionListView(viewModel: QuestionListViewModel(questions: [
                QuestionModel(type: .anime, emoji: "sdsdfsdfsdfsdfwerderff", answers: ["1", "2", "3"], correctAnswer: "2"),
        
                QuestionModel(type: .anime, emoji: "3490=t0ywvhjiw", answers: ["1", "2", "3"], correctAnswer: "1"),
        
                QuestionModel(type: .anime, emoji: "9c0j=WAG", answers: ["1", "2", "3"], correctAnswer: "2"),
        
                QuestionModel(type: .anime, emoji: "9c0j=WsdaAG", answers: ["1", "2", "3"], correctAnswer: "2"),
        
                QuestionModel(type: .anime, emoji: "9c0jwedfg=WAG", answers: ["1", "2", "3"], correctAnswer: "2"),
        
                QuestionModel(type: .anime, emoji: "9c0j=sdzdWAG", answers: ["1", "2", "3"], correctAnswer: "2"),]))
}
