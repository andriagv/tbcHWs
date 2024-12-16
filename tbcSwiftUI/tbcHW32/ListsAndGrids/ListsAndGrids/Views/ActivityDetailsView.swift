//
//  ActivityDetailsView.swift
//  Navigation
//
//  Created by Apple on 13.12.24.
//

import SwiftUI

struct ActivityDetailsView: View {
    let timer: TimerModel
    @ObservedObject var viewModel: TimerViewModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                headerView()
                timerSection()
                    .padding(.horizontal)
                StatisticView(timer: timer)
                    .padding(.horizontal)
                ActivityHistory(timer: timer)
                Spacer()
            }
        }
        .background(Color.black)
    }
    
    private func headerView() -> some View {
        VStack {
            Color.clear
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image("arrow_back", bundle: .none)
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text(timer.name)
                            .makeTextStyle(color: .white, size: 24, font: nil)
                    }
                }
                .frame(height: 1)
                .background(Color.cardBackgroundColor)
        }
    }
    
    private func timerSection() -> some View {
        VStack(spacing: 20) {
            Image("Illustration", bundle: .none)
                .resizable()
                .frame(width: 44, height: 44)
            Text("ხანგრძლივობა")
                .makeTextStyle(color: .white, size: 20, font: nil)
                .bold()
            Text(String(format: "%02d:%02d:%02d", timer.initialHours, timer.initialMinutes, timer.initialSeconds))
                .foregroundColor(.blue)
                .font(.custom("Inter_28pt.ttf", size: 36))
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.vertical)
        .background(Color.cardBackgroundColor)
        .cornerRadius(16)
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        formatter.locale = Locale(identifier: "ka_GE")
        return formatter.string(from: date)
    }
}

#Preview {
    ActivityDetailsView(timer: TimerModel(
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
                    Time(startTime: "12:32", sessionDuration: "01:45:00"),
                    Time(startTime: "15:20", sessionDuration: "00:45:00")
                ],
                day: "13 დეკ 2024"
            ),
            ActiviteData(
                time: [
                    Time(startTime: "10:00", sessionDuration: "01:00:00"),
                    Time(startTime: "12:30", sessionDuration: "00:30:00")
                ],
                day: "12 დეკ 2024"
            )
        ]),
        viewModel: TimerViewModel())
}
