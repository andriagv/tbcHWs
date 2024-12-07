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
            .frame(height: 187)
        
        HStack {
            
            Spacer()
                .frame(width: 49)
            
            VStack {
                MainView()
                    .cornerRadius(20)
            }
            
            Spacer()
                .frame(width: 49)
        }
        
        Spacer()
            .frame(height: 187)
    }
}

#Preview {
    ContentView()
}
