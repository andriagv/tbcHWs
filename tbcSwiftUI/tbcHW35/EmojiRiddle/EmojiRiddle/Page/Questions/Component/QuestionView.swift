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
                                )
                                .frame(width: 25, height: 25)
                        }
                        Text(answer)
                    }
                    .foregroundStyle(.white)
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
        .background(Color(uiColor: .systemBlue).gradient.opacity(0.4))
        .cornerRadius(10)
        .shadow(color: .red.opacity(0.4), radius: 10)
    }
}


#Preview {
    QuestionView(
        viewModel: QuestionViewModel(
            question: QuestionModel(type: .anime, emoji: "sdsdfsdfsdfsdfwerderff", answers: ["1", "2", "3"], correctAnswer: "2")
        )
    )
}
