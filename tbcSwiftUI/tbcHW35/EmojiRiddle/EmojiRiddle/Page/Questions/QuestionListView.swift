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
                ForEach(viewModel.selectQuestions, id: \.self) { question in
                    QuestionView(viewModel: QuestionViewModel(question: question))
                        .onTapGesture {
                            print("davawire")
                            //viewModel.checkGameCompletion()
                        }
                }
            }
        }
        .padding()
        .background(Color(uiColor: .systemBlue).gradient.opacity(0.5))
        .alert("თამაში დასრულდა", isPresented: $viewModel.isGameFinished) {
            Button("OK") { }
        } message: {
            Text("საერთო ქულები: \(viewModel.totalScore, specifier: "%.1f")")
        }
    }
}



#Preview {
    QuestionListView(viewModel: QuestionListViewModel(selectQuestions: [
        QuestionModel(type: .anime, emoji: "sdsdfsdfsdfsdfwerderff", answers: ["1", "2", "3"], correctAnswer: "2", hint: "sad"),
        
        
        QuestionModel(type: .anime, emoji: "9c0j=sdzdWAG", answers: ["1", "2", "3"], correctAnswer: "2", hint: "sad")]))
    
}
