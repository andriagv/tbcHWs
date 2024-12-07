//
//  MainView.swift
//  SwiftUIBasics
//
//  Created by Apple on 06.12.24.
//

import SwiftUI

struct MainView: View {
    @State var status = true
    
    var body: some View {
        
        VStack {
            Spacer(minLength: 20)
            
            ImageView(status: self.$status)
                .padding(.bottom, 20)
            
            VStack(spacing: 5) {
                Text("John Doe")
                    .font(.system(size: 20))
                    .bold()
                
                Text("iOS Developer")
                    .opacity(0.8)
                    .font(.system(size: 16))
            }
            
            AppsView()
                .padding(.bottom, 10)
            
            HStack(spacing: 20) {
                
                SkillsView()
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            
            SwitcherView(status: self.$status)
            
            Spacer(minLength: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "#0000FF"),
                    Color(hex: "#800080")
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .opacity(0.65)
        )
        .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
