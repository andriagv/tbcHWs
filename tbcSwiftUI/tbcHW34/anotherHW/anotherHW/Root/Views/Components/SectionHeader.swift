//
//  SectionHeader.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    let imageName: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 3)
                )
                .shadow(color: .black.opacity(0.6), radius: 10, x: 0, y: 5)
                .scaleEffect(1.2)
                .padding()
            Spacer()
            Text(title)
                .font(.title2)
                .bold()
            Spacer()
        }
        .padding(.horizontal)
        .background(.gray.opacity(0.5))
        .cornerRadius(20)
    }
}


#Preview {
    SectionHeader(title: "ddk", imageName: "EminemGodzillaImage")
}
