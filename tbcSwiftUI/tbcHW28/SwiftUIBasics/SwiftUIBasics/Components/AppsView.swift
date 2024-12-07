//
//  AppsView.swift
//  SwiftUIBasics
//
//  Created by Apple on 06.12.24.
//

import SwiftUI

struct AppsView: View {
    var body: some View {
        
        HStack(alignment: .top, spacing: 30) {
            
            ForEach(["phone", "envelope", "globe"], id: \.self) { iconName in
                
                ZStack {
                    Circle()
                        .frame(height: 40)
                        .foregroundColor(Color.black.opacity(0.2))
                    Image(systemName: iconName)
                        .frame(height: 20)
                }
            }
        }
        .padding()
    }
}

#Preview {
    AppsView()
}
