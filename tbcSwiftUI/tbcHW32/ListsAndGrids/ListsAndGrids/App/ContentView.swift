//
//  ContentView.swift
//  ListsAndGrids
//
//  Created by Apple on 15.12.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TimerViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Text("ტაიმერები")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .makeTextStyle(color: .white, size: 24, font: nil)
                    Spacer()
                }
                .padding()
                .background(Color.cardBackgroundColor)
                ScrollView {
                    VStack (spacing: 20) {
                        ForEach(viewModel.timers) { timer in
                            NavigationLink {
                                ActivityDetailsView(timer: timer, viewModel: viewModel)
                            } label: {
                                TimerCardView(timer: timer, viewModel: viewModel)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                AddTimerView(viewModel: viewModel)
            }
            .background(.black)
        }
    }
}


#Preview {
    ContentView()
}
