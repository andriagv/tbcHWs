//
//  ContentView.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MusicViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
                    .edgesIgnoringSafeArea(.all)
                
                TabView {
                    HomePage(viewModel: viewModel)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    LikedMusicPage(viewModel: viewModel)
                        .tabItem {
                            Label("Likes", systemImage: "heart.fill")
                        }
                }
                .background(Color.clear)
            }
        }
    }
}


#Preview {
    ContentView()
}
