//
//  ContentView.swift
//  Essentials
//
//  Created by Apple on 07.12.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 23){
            
            HeaderView()
            
            Text("Work Experience")
                .makeTextStyle(color: .black, size: 20, font: "Inter_Bold")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ExperienceView()
            
            AddNewExperienceView()
        
        }
        .padding(25)
        .background(Color(hex: "FFFFFF"))
    }
}

#Preview {
    ContentView()
}
