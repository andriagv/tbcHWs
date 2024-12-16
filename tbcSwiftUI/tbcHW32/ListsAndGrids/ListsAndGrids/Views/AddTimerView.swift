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
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                TextField("", text: $timerName, prompt: Text("ტაიმერის სახელი...").foregroundColor(.textFieldTintColor))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 20)
                    .makeTextFieldStyle()
            }
            HStack (alignment: .center, spacing: 10) {
                TextField("", text: $hours, prompt: Text("სთ").foregroundColor(.textFieldTintColor))
                    .makeTextFieldStyle()
                TextField("", text: $minutes, prompt: Text("წთ").foregroundColor(.textFieldTintColor))
                    .makeTextFieldStyle()
                    .onChange(of: minutes) { newValue in
                        if let intValue = Int(newValue), intValue >= 60 {
                            minutes = ""
                            alertMessage = "წუთები ვერ იქნება 60-ზე მეტი."
                            showAlert = true
                        }
                    }
                TextField("", text: $seconds, prompt: Text("წმ").foregroundColor(.textFieldTintColor))
                    .makeTextFieldStyle()
                    .onChange(of: seconds) { newValue in
                        if let intValue = Int(newValue), intValue >= 60 {
                            seconds = ""
                            alertMessage = "წამი ვერ იქნება 60-ზე მეტი."
                            showAlert = true
                        }
                    }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("არასწორი მნიშვნელობა"),
                      message: Text(alertMessage),
                      dismissButton: .default(Text("OK")))
            }
            
            Button(action: addTimer) {
                Text("დამატება")
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                    .makeButtonStyle(tintColor: nil, backgroundColor: .addButtonColor)
            }
            .padding(.top, 10)
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
