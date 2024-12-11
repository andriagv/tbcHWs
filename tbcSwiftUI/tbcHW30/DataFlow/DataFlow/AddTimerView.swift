//
//  AddTimerView.swift
//  DataFlow
//
//  Created by Apple on 11.12.24.
//

import SwiftUI

struct AddTimerView: View {
    @ObservedObject var viewModel: TimerViewModel
    
    @State private var timerName: String = ""
    @State private var hours: String = ""
    @State private var minutes: String = ""
    @State private var seconds: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                TextField("ტაიმერის სახელი", text: $timerName)
                    .padding(.leading, -UIScreen.main.bounds.width / 3)
                    .makeTextFieldStyle()
            }

            HStack (alignment: .center, spacing: 10) {
                TextField("სთ", text: $hours)
                    .makeTextFieldStyle()
                TextField("წთ", text: $minutes)
                    .makeTextFieldStyle()
                TextField("წმ", text: $seconds)
                    .makeTextFieldStyle()
            }
            
            Button(action: addTimer) {
                Text("დამატება")
                    .makeButtonStyle(tintColor: nil, backgroundColor: .addButtonColor)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
        }
        .padding()
        .background(Color.cardBackgroundColor)
    }
    
    private func addTimer() {
        guard let h = Int(hours), let m = Int(minutes), let s = Int(seconds), !timerName.isEmpty else {
            return
        }
        viewModel.addTimer(name: timerName, hours: h, minutes: m, seconds: s)
        clearFields()
    }
    
    private func clearFields() {
        timerName = ""
        hours = ""
        minutes = ""
        seconds = ""
    }
}

#Preview {
    ContentView()
}
