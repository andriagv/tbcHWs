//
//  ActivityDetailsView.swift
//  Navigation
//
//  Created by Apple on 13.12.24.
//

import SwiftUI

struct ActivityDetailsView: View {
    //@Binding var timer: TimerModel
    var timer = TimerModel(
        id: UUID(),
        name: "name",
        hours: 2,
        minutes: 3,
        seconds: 4,
        initialHours: 2,
        initialMinutes: 3,
        initialSeconds: 4,
        isActive: false
    )
    
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
            Text("ვარჯიში")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .center)
                .makeTextStyle(color: .white, size: 24, font: nil)
                .padding()
                .background(Color.cardBackgroundColor)
        }
        
        private func timerSection() -> some View {
            VStack(spacing: 20) {
                Image("Illustration", bundle: .none)
                Text("ხანგრძლივობა")
                Text(String(format: "%02d:%02d:%02d", timer.hours, timer.minutes, timer.seconds))
                    .foregroundColor(.blue)
                    .font(.custom("Inter_28pt.ttf", size: 36))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.cardBackgroundColor)
            .cornerRadius(16)
        }
        
        private func activityHistorySection() -> some View {
            VStack {
                VStack(spacing: 30) {
                    HStack {
                        Text("აქტივობის ისტორია")
                            .makeTextStyle(color: .white, size: 18, font: "Inter_28pt")
                        Spacer()
                    }
                    Divider()
                        .background(Color.white)
                }
                .padding()
                
                VStack {
                    HStack {
                        Text("თარიღი")
                        Spacer()
                        Text("დრო")
                    }
                    ScrollView {
                        LazyVStack {
                            HStack(alignment: .center) {
                                Text("oka")
                                Spacer()
                                Text("oka")
                            }
                            .background(Color.green)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .background(Color.cardBackgroundColor)
            .cornerRadius(16)
        }
}

#Preview {
    ActivityDetailsView()
}
