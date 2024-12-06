//
//  SetStatusView.swift
//  SwiftUIBasics
//
//  Created by Apple on 06.12.24.
//

import SwiftUI

struct SetStatusView: View {
    @Binding var status: Bool
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    if status {
                        Text("Set Offline")
                    } else {
                        Text("Set Online")
                    }
                    
                    Toggle("", isOn: $status)
                        .labelsHidden()
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 20)
                .background(Color.white.opacity(0.2))
                .foregroundColor(.white)
                .cornerRadius(25)
                .font(.headline)
            }
        }
    }
}

#Preview {
    ContentView()
}
