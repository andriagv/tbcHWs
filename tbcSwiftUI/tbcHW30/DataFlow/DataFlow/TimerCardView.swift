//
//  TimerCardView.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.
//


import SwiftUI

struct TimerCardView: View {
    let timer: TimerModel
    @ObservedObject var viewModel: TimerViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack {
                Text(timer.name)
                    .font(.headline)
                    .makeTextStyle(color: .white, size: 18, font: nil)
                Spacer()
                Button(action: { viewModel.deleteTimer(id: timer.id) }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
            }

            Text(String(format: "%02d:%02d:%02d", timer.hours, timer.minutes, timer.seconds))
                .font(.system(size: 36))
                .foregroundColor(.blue)

            HStack () {
                Button(timer.isActive ? "შეჩერება" : "დაწყება") {
                    if timer.isActive {
                        viewModel.stopTimer(id: timer.id)
                    } else {
                        viewModel.startTimer(id: timer.id)
                    }
                }
                .frame(maxWidth: .infinity)
                .makeButtonStyle(
                    tintColor: nil,
                    backgroundColor: timer.isActive ? .stopButtonColor : .startButtonColor
                )

                Button("გადატვირთვა") {
                    viewModel.resetTimer(id: timer.id)
                }
                .frame(maxWidth: .infinity)
                .makeButtonStyle(tintColor: nil, backgroundColor: .resetButtonColor)
            }
            .padding(.top)
        }
        .padding()
        .background(Color.cardBackgroundColor)
        .cornerRadius(10)
    }
}
#Preview {
    ContentView()
}

