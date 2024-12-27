//
//  SadView.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//


import SwiftUI

struct SadView: View {
    let totalScore: Double
    @State private var scaleEffect: CGFloat = 0.5
    @State private var opacity: Double = 0.0
    let audioManager = AudioManager()
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 30) {
                Spacer()
                Text("😢 სამწუხაროდ, წააგე 😢")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .shadow(radius: 10)
                    .scaleEffect(scaleEffect)
                    .opacity(opacity)
                    .animation(.easeInOut(duration: 1), value: scaleEffect)
                
                Text("შენი ქულაა:")
                    .font(.title)
                    .foregroundColor(.white)
                
                Text("\(totalScore, specifier: "%.1f") ქულა")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.red)
                    .shadow(radius: 10)
                    .scaleEffect(scaleEffect)
                    .opacity(opacity)
                    .animation(.easeInOut(duration: 1).delay(0.3), value: scaleEffect)
                
                Spacer()
                
                Text("გთხოვთ, სცადეთ კვლავ")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [.gray, .blue.opacity(0.7), .black]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .onAppear {
            scaleEffect = 1.0
            opacity = 1.0
            audioManager.playSound(name: "sad")
        }
    }
}


#Preview {
    SadView(totalScore: 3)
}
