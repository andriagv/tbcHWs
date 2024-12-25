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
        Music(imageName: "BENNETTVoissurtoncheminImage", name: "Vois sur ton chemin", artist: "Spinnin' Records", audioFileName: "BENNETTVoissurtonchemin"),
        Music(imageName: "BenzzJeMappelleImage", name: "Je M'appelle", artist: "GRM Daily", audioFileName: "BenzzJeMappelle"),
        Music(imageName: "borisbrejchaItakeitsmartImage", name: "I take it smart", artist: "boris brejcha", audioFileName: "borisbrejchaItakeitsmart"),
        Music(imageName: "BorisBrejchaNeverLookBackImage", name: "Never Look Back", artist: "Boris Brejcha", audioFileName: "BorisBrejchaNeverLookBack"),
        Music(imageName: "DimitriVegasMartinGarrixImage", name: "Tremor", artist: "Dimitri Vegas", audioFileName: "DimitriVegasMartinGarrix"),
        Music(imageName: "RaffaellaCarraPedroImage", name: "la canción de pedro", artist: "Raffaella Carrà", audioFileName: "RaffaellaCarraPedro"),
        Music(imageName: "ShantiPeopleTandavaImage", name: "Shanti People", artist: "Tandava", audioFileName: "ShantiPeopleTandava"),
        Music(imageName: "TimmyTrumpetAviciiShowtekImage", name: "Timmy Trumpet", artist: "Freaks", audioFileName: "TimmyTrumpetAviciiShowtek"),
    ]
    
    @Published var QueenMusic: [Music] = [
        Music(imageName: "QueenBohemianRhapsodyImage", name: "Bohemian Rhapsody", artist: "Queen", audioFileName: "QueenBohemianRhapsody"),
        Music(imageName: "QueenKillerQueenImage", name: "Killer", artist: "Queen", audioFileName: "QueenKillerQueen"),
        Music(imageName: "QueenTheShowMustGoOnImage", name: "The Show Must Go On", artist: "Queen", audioFileName: "QueenTheShowMustGoOn"),
        
    ]
    
    @Published var AllenMusic: [Music] = [
        Music(imageName: "MyFavoriteSwiftUIUpdatesIOS18Image", name: "Bohemian Rhapsody", artist: "Sean Allen", audioFileName: "MyFavoriteSwiftUIUpdatesIOS18"),
        Music(imageName: "SwiftClosuresescapingImage", name: "Killer", artist: "Sean Allen", audioFileName: "SwiftClosuresescaping"),
        Music(imageName: "XcodeTipShowBuildTimesImage", name: "The Show Must Go On", artist: "Sean Allen", audioFileName: "XcodeTipShowBuildTimes"),
        
    ]
    
    @Published var allMusic: [Music] = []
    
    @Published var artists: [Artist] = []
    
    init() {
        updateAllMusic()
        updateArtists()
    }
    
    private func updateAllMusic() {
        allMusic = (eminemMusic + QueenMusic + technoMusic + AllenMusic).shuffled()
    }
    
    private func updateArtists() {
        artists = [
            Artist(name: "Sean Allen", image: "Allen", musics: self.AllenMusic),
            Artist(name: "Techno", image: "BorisBrejchaNeverLookBackImage", musics: self.technoMusic),
            Artist(name: "Eminem", image: "EminemRapGodImage", musics: self.eminemMusic),
            Artist(name: "Queen", image: "QueenTheShowMustGoOnImage", musics: self.QueenMusic)
            
        ]
    }
    
    func refreshMusic() {
        updateAllMusic()
    }
}



