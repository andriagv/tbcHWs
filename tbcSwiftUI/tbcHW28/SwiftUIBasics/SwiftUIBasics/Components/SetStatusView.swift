//
//  SetStatusView.swift
//  SwiftUIBasics
//
//  Created by Apple on 06.12.24.
//

import SwiftUI

struct SetStatusView: View {
    @State var status = true
    
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
                            .padding()
                    }
                    .padding(.leading)
                    .background(Color.white.opacity(0.2))
                    .foregroundColor(.white)
                    .cornerRadius(40)
                    .font(.headline)
                }
            }
        }
}

#Preview {
    SetStatusView()
}
