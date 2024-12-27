//
//  CongratulationsView.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//


import SwiftUI

struct CongratulationsView: View {
    let totalScore: Double
    @State private var scaleEffect: CGFloat = 0.5
    @State private var opacity: Double = 0.0
    let audioManager = AudioManager()
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 30) {
                Spacer()
                Text("🎉 გილოცავ! 🎉")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                    .shadow(radius: 10)
                    .scaleEffect(scaleEffect)
                    .opacity(opacity)
                    .animation(.easeInOut(duration: 1), value: scaleEffect)
                
                Text("შენ მოიპოვე:")
                    .font(.title)
                    .foregroundColor(.white)
                
                Text("\(totalScore, specifier: "%.1f") ქულა")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.green)
                    .shadow(radius: 10)
                    .scaleEffect(scaleEffect)
                    .opacity(opacity)
                    .animation(.easeInOut(duration: 1).delay(0.3), value: scaleEffect)
                Spacer()
                Text("ყოჩაღ შენი მჯეროდა :დ")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [.blue, .purple, .pink]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .onAppear {
            scaleEffect = 1.0
            opacity = 1.0
            audioManager.playSound(name: "happy")
        }
    }
}

#Preview {
    CongratulationsView(totalScore: 5)
}
