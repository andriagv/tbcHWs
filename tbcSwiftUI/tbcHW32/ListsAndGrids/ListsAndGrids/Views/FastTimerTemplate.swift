//
//  FastTimerTemplate.swift
//  ListsAndGrids
//
//  Created by Apple on 15.12.24.
//

import SwiftUI

struct FastTimerTemplate: View {
    
    @ObservedObject var fastTimerviewModel: FastTimerViewModel
    @ObservedObject var viewModel: TimerViewModel
    
    private let adaptiveColumn = [
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    var body: some View {
        ScrollView {
            HStack {
                Text("სწრაფი რაიმერები")
                    .makeTextStyle(color: .white, size: 20, font: "Roboto-Black")
                Spacer()
            }
            .padding()
            
            LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                ForEach(fastTimerviewModel.fastTimersArray) { timer in
                    Button { viewModel.addTimer(name: timer.name, hours: timer.hours, minutes: timer.minutes, seconds: timer.seconds)
                    } label: {
                        VStack(alignment: .center, spacing: 10) {
                            Text(fastTimerviewModel.formattedTime(for: timer))
                                .foregroundColor(.blue)
                                .font(.custom("Inter_28pt.ttf", size: 20))
                            
                            Text(timer.name)
                                .font(.custom("Inter_28pt.ttf", size: 15))
                        }
                    }
                    .frame(width: 108, height: 94, alignment: .center)
                    .background(Color.cardBackgroundColor)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }
            }
        }
        .padding()
        .background(.black)
    }
}

#Preview {
    FastTimerTemplate(fastTimerviewModel: FastTimerViewModel(), viewModel: TimerViewModel())
}
