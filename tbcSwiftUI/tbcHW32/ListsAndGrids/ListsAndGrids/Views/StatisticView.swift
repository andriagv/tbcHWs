//
//  StatisticView.swift
//  ListsAndGrids
//
//  Created by Apple on 16.12.24.
//

import SwiftUI

struct StatisticView: View {
    
    let timer: TimerModel
    let viewModel = StatisticViewModel()
    let array = ["დღევანდელი სესიები", "საშუალო ხანგრძლივობა", "ჯამური დრო"]
    
    var body: some View {
        VStack(spacing: 0) {
            Section(header: Text("")
                .foregroundColor(.gray)
                .font(.headline)) {
                    ForEach(0..<array.count, id: \.self) { index in
                        HStack {
                            Text(array[index])
                                .foregroundStyle(Color.DustyGray)
                                .makeTextStyle(color: Color.DustyGray, size: 15, font: nil)
                                .bold()
                            Spacer()
                            Text(viewModel.makeArray(timer: timer)[index])
                                .makeTextStyle(color: .white, size: 15, font: nil)
                                .bold()
                        }
                        .padding(.vertical, 10)
                        if index < array.count - 1 {
                            Divider()
                                .background(.gray)
                        }
                    }
                }
        }
        .padding()
        .background(Color.cardBackgroundColor)
        .cornerRadius(10)
    }
}


#Preview {
    StatisticView(timer: TimerModel(
        id: UUID(),
        name: "name",
        hours: 2,
        minutes: 3,
        seconds: 4,
        initialHours: 2,
        initialMinutes: 3,
        initialSeconds: 4,
        isActive: false,
        durationInSeconds: 234452,
        activiteData: [
            ActiviteData(
                time: [
                    Time(startTime: "13:33", sessionDuration: "00:55:00"),
                    Time(startTime: "04:20", sessionDuration: "00:40:40"),
                    Time(startTime: "04:20", sessionDuration: "01:40:40")
                ],
                day:" Date()"
            ),
            ActiviteData(
                time: [
                    Time(startTime: "10:00", sessionDuration: "01:00:00"),
                    Time(startTime: "15:60", sessionDuration: "00:10:00")
                ],
                day: "13 დეკ 2025"
            )
        ]))
}
