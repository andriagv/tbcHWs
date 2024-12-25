//
//  MusicViewModel.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//

import Foundation
import SwiftUI


final class MusicViewModel: ObservableObject {
    @Published var eminemMusic: [Music] = [
        Music(imageName: "EminemGodzillaImage", name: "Godzilla", artist: "Eminem", audioFileName: "EminemGodzilla"),
        Music(imageName: "EminemHoudiniImage", name: "Houdini", artist: "Eminem", audioFileName: "EminemHoudini"),
        Music(imageName: "EminemMockingbirdImage", name: "Mockingbird", artist: "Eminem", audioFileName: "EminemMockingbird"),
        Music(imageName: "EminemRapGodImage", name: "RapGod", artist: "Eminem", audioFileName: "EminemRapGod"),
        Music(imageName: "EminemWithoutMeImage", name: "WithoutMe", artist: "Eminem", audioFileName: "EminemWithoutMe"),
    ]
    
    @Published var technoMusic: [Music] = [
        Music(imageName: "BENNETTVoissurtoncheminImage", name: "Godzilla", artist: "Eminem", audioFileName: "BENNETTVoissurtonchemin"),
        Music(imageName: "BenzzJeMappelleImage", name: "Houdini", artist: "Eminem", audioFileName: "BenzzJeMappelle"),
        Music(imageName: "borisbrejchaItakeitsmartImage", name: "Mockingbird", artist: "Eminem", audioFileName: "borisbrejchaItakeitsmart"),
        Music(imageName: "BorisBrejchaNeverLookBackImage", name: "RapGod", artist: "Eminem", audioFileName: "BorisBrejchaNeverLookBack"),
        Music(imageName: "DimitriVegasMartinGarrixImage", name: "WithoutMe", artist: "Eminem", audioFileName: "DimitriVegasMartinGarrix"),
        Music(imageName: "RaffaellaCarraPedroImage", name: "WithoutMe", artist: "Eminem", audioFileName: "RaffaellaCarraPedro"),
        Music(imageName: "ShantiPeopleTandavaImage", name: "WithoutMe", artist: "Eminem", audioFileName: "ShantiPeopleTandava"),
        Music(imageName: "TimmyTrumpetAviciiShowtekImage", name: "WithoutMe", artist: "Eminem", audioFileName: "TimmyTrumpetAviciiShowtek"),
    ]
    
    func toggleFavorite(for music: Music, in category: Binding<[Music]>) {
            if let index = category.wrappedValue.firstIndex(where: { $0.id == music.id }) {
                category.wrappedValue[index].isFavorite.toggle()
            }
        }
}


