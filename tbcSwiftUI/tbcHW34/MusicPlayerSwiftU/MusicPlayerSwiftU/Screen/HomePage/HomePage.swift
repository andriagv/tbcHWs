//
//  HomePage.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct HomePage: View {
    @ObservedObject var viewModel: MusicViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 16) {
                MusicSection(title: "Eminem", imageName: "EminemGodzillaImage", musicList: $viewModel.eminemMusic)
                MusicSection(title: "Techno", imageName: "BorisBrejchaNeverLookBackImage", musicList: $viewModel.technoMusic)
            }
            .padding()
        }
        .navigationTitle("Home")
    }
}




#Preview {
    ContentView()
}

