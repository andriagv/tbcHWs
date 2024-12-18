//
//  ActivityHistory.swift
//  ListsAndGrids
//
//  Created by Apple on 15.12.24.
//


import SwiftUI

struct ActivityHistory: View {
    let timer: TimerModel
    let timerViewModel = TimerViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("აქტივობის ისტორია")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                Spacer()
            }
            List {
                ForEach(timer.activiteData, id: \.day) { group in
                    Section(header: Text(group.day)
                        .foregroundColor(.gray)
                        .makeTextStyle(color: .gray, size: 14, font: "Inter_28pt")
                        .font(.headline)) {
                            ForEach(group.time.indices, id: \.self) { index in
                                HStack {
                                    Text(group.time[index].startTime)
                                        .foregroundColor(.white)
                                        .font(.body)
                                    Spacer()
                                    if let number = Int(group.time[index].sessionDuration) {
                                        Text(timerViewModel.formatDuration(number))
                                            .foregroundColor(.gray)
                                            .font(.body)
                                    } else {
                                        Text(group.time[index].sessionDuration)
                                            .font(.body)
                                    }
                                }
                                .padding(.vertical, 5)
                            }
                        }
                        .listRowBackground(Color.black)
                        .listRowSeparatorTint(Color.gray)
                }
            }
            .listStyle(GroupedListStyle())
        }
        .background(Color.black)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    ActivityHistory(timer: TimerModel(
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
                    Time(startTime: "13:33", sessionDuration: "05:55:00"),
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
