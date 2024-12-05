//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by Apple on 06.12.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Spacer()
            .frame(height: 80)
        
        HStack {
            
            Spacer()
                .frame(width: 40)
            
            VStack {
                MainView()
                    .cornerRadius(20)
            }
            
            Spacer()
                .frame(width: 40)
        }
        
        Spacer()
            .frame(height: 80)
    }
}

#Preview {
    ContentView()
}
