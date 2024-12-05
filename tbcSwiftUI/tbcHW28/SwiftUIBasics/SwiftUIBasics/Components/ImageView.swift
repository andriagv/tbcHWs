//
//  ImageView.swift
//  SwiftUIBasics
//
//  Created by Apple on 06.12.24.
//

import SwiftUI


struct ImageView: View {
    @State var status = true

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("image_1")
                .resizable()
                .frame(width: 120, height: 120)
                .padding()
                .background(Color.white)
                .cornerRadius(80)
                .padding()

            if status {
                Text("Online")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            } else {
                Text("Offline")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }
    }
}

#Preview {
    ImageView()
}
