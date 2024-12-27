//
//  QuestionListView.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//

import SwiftUI


struct QuestionListView: View {
    @ObservedObject var viewModel: QuestionListViewModel
    @State private var showCongratulations = false
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 30) {
                ForEach(viewModel.selectQuestions, id: \.id) { question in
                    QuestionView(
                        viewModel: QuestionViewModel(question: question),
                        checkGameCompletion: {
                            viewModel.checkGameCompletion()
                            if viewModel.isGameFinished {
                                showCongratulations = true
                            }
                        }
                    )
                }
            }
        }
        .padding()
        .background(Color(uiColor: .systemBlue).gradient.opacity(0.5))
        .fullScreenCover(isPresented: $showCongratulations) {
            if !viewModel.choseView() {
                SadView(totalScore: viewModel.totalScore)
            } else {
                CongratulationsView(totalScore: viewModel.totalScore)
            }
        }
    }
}

