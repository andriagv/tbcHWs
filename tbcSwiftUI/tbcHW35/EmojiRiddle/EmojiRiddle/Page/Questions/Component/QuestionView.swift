//
//  QuestionView.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//

import SwiftUI


struct QuestionView: View {
    @ObservedObject var viewModel: QuestionViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Spacer()
                Text(viewModel.question.emoji)
                    .padding(.bottom)
                    .font(.largeTitle)
                ForEach(viewModel.question.answers, id: \.self) { answer in
                    HStack {
                        Button {
                            viewModel.selectAnswer(answer)
                        } label: {
                            Circle()
                                .stroke(viewModel.selectedAnswer == answer ? Color.clear : Color.primary)
                                .background(
                                    Circle()
                                        .fill(
                                            viewModel.selectedAnswer == answer
                                                ? (viewModel.isCorrectAnswer(answer) ? Color.green : Color.red).opacity(0.7)
                                                : Color.clear
                                        )
                                        .animation(.easeInOut, value: viewModel.selectedAnswer)
                                )
                                .frame(width: 25, height: 25)
                        }
                        .disabled(viewModel.question.isAnswered || viewModel.attemptsLeft == 0) // ბლოკავს პასუხების ღილაკებს
                        
                        Text(answer)
                    }
                    .foregroundStyle(.white)
                }
                Spacer()
                Text("თქვენი ქულა: \(viewModel.score, specifier: "%.1f")")
                    .font(.headline)
                    .foregroundColor(.yellow)
            }
            Spacer()
        }
        .padding()
        .background(Color(uiColor: .systemBlue).gradient.opacity(0.4))
        .cornerRadius(10)
        .shadow(color: .red.opacity(0.4), radius: 10)
        .alert(viewModel.question.hint, isPresented: $viewModel.showHintAlert) {
            Button("დახურვა") {
                viewModel.selectedAnswer = nil
            }
        } message: {
            Text("დამატებითი მინიშნება")
        }
    }
}
