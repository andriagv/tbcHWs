//
//  MainView.swift
//  SwiftUIBasics
//
//  Created by Apple on 06.12.24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Spacer() 
            
            ImageView()
            
            VStack(spacing: 5) {
                Text("John Doe")
                    .font(.system(size: 20))
                    .bold()
                
                Text("iOS Developer")
                    .opacity(0.8)
                    .font(.system(size: 16))
            }
            .padding(.bottom, 20)
            
            NetworkAppsView()
                .padding(.bottom, 20)
            
            HStack(spacing: 20) {
                SkillsView()
                Spacer()
            }
            .padding(.horizontal, 30)
            
            Spacer()
            SetStatusView()
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "#0000FF"),
                    Color(hex: "#800080")
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .opacity(0.65)
        )
        
        .foregroundColor(.white)
    }
}

#Preview {
    MainView()
}
