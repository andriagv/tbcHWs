//
//  LikedMusicPage.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct LikedMusicPage: View {
    @ObservedObject var viewModel: MusicViewModel
    
    var body: some View {
        NavigationStack {
            List(favoriteMusic, id: \.id) { music in
                NavigationLink {
                    MusicDetailsView(music: music)
                } label: {
                    MusicRowView(music: music)
                }
            }
            .navigationTitle("Liked Music")
        }
    }
    
    private var favoriteMusic: [Music] {
        (viewModel.eminemMusic + viewModel.technoMusic).filter { $0.isFavorite }
    }
}



