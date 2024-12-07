//
//  ImageView.swift
//  SwiftUIBasics
//
//  Created by Apple on 06.12.24.
//

import SwiftUI


struct ImageView: View {
    @Binding var status: Bool
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            Image("image_1")
                .resizable()
                .frame(width: 102, height: 102)
                .padding(9)
                .background(Color.white)
                .clipShape(Circle())
            
            Text(status ? "Online" : "Offline")
                .font(.caption)
                .bold()
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(status ? Color.green : Color.red)
                .foregroundColor(.white)
                .cornerRadius(20)
        }
    }
}

#Preview {
    ContentView()
}
