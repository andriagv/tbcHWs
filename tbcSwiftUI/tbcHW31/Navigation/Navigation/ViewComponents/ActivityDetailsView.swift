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
            headerView()
            
            VStack(spacing: 20) {
                timerSection()
                activityHistorySection()
            }
            .padding()
        }
        .background(Color.black)
    }
    
    private func headerView() -> some View {
        HStack {
            Text("")
                .frame(maxWidth: .infinity)
                .background(Color.cardBackgroundColor)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image("navigate_before", bundle: .none)
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text(timer.name)
                            .makeTextStyle(color: .white, size: 24, font: nil)
                    }
                }
                .padding()
                .background(Color.cardBackgroundColor)
        }
    }
    
    private func timerSection() -> some View {
        VStack(spacing: 20) {
            Image("Illustration", bundle: .none)
            Text("ხანგრძლივობა")
                .makeTextStyle(color: .white, size: 18, font: nil)
            Text(String(format: "%02d:%02d:%02d", timer.initialHours, timer.initialMinutes, timer.initialSeconds))
                .foregroundColor(.blue)
                .font(.custom("Inter_28pt.ttf", size: 36))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.cardBackgroundColor)
        .cornerRadius(16)
    }
    
    private func activityHistorySection() -> some View {
        VStack {
            ScrollView {
                VStack(spacing: 30) {
                    HStack {
                        Text("აქტივობის ისტორია")
                            .makeTextStyle(color: .white, size: 18, font: "Inter_28pt")
                        Spacer()
                    }
                    .padding(.top)
                    Divider()
                        .padding(.vertical, 1)
                        .background(Color.white)
                    
                }
                .padding()
                VStack {
                    HStack {
                        Text("თარიღი")
                        Spacer()
                        Text("დრო")
                            .padding(.trailing, 20)
                    }
                    .makeTextStyle(color: .white, size: 14, font: nil)
                    
                    LazyVStack {
                        HStack(alignment: .center) {
                            if timer.durationInSeconds != 0 {
                                VStack(spacing: 10) {
                                    Text("\(formattedDate(timer.date))")
                                    
                                }
                                Spacer()
                                VStack(spacing: 10) {
                                    Text("\(viewModel.formatDuration(timer.durationInSeconds))")
                                }
                            }
                            
                        }
                        .makeTextStyle(color: .white, size: 14, font: nil)
                    }
                    
                }
                .padding(.horizontal)
            }
        }
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
        date: Date()),
                        viewModel: TimerViewModel())
}
