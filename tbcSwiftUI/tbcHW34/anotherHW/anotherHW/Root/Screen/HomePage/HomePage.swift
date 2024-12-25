//
//  HomePage.swift
//  anotherHW
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct HomePage: View {
    @ObservedObject var viewModel = MusicViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primary_color.edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        HomeHeaderView(headerStr: "გამარჯობა 👋")
                        
                        HomeMusicRowtView(musicList: viewModel.allMusic)
                        
                        HomeRecentlyPlayedView(artists: viewModel.artists)
                        
                        MadeForView()
                        
                        Spacer().frame(height: 150)
                    }
                    .padding(.horizontal, 16)
                }
                .animation(.spring(), value: viewModel.eminemMusic)
                
            }
        }
    }
}

#Preview {
    HomePage()
}
