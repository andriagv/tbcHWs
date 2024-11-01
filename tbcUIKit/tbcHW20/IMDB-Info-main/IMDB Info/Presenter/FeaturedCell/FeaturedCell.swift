//
//  FeaturedCell.swift
//  IMDB Info
//
//  Created by Nika Topuria on 26.10.21.
//

import UIKit
import CoreMIDI

final class FeaturedCell: UITableViewCell {

    private let imagePrefix = "https://image.tmdb.org/t/p/w500/"
    private let genreListUrl = "https://api.themoviedb.org/3/genre/movie/list?api_key=b688d2e3d40e21d185f1dd90d122a568&language=en-US"
    private var genreList = [Genre]()
    @IBOutlet private var mainImageView: UIImageView!
    @IBOutlet private var movieScore: UILabel!
    @IBOutlet private weak var genresLabel: UILabel!
    @IBOutlet var scoreStars: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        GenreManager.fetchGenreList(with: genreListUrl) { genreList in
            self.genreList = genreList.genres
        }
        
        self.showAnimatedGradientSkeleton()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.stopSkeletonAnimation()
            self.hideSkeleton()
        })
    }
    
    
    func makeNew(_ movie: Movie) {
        mainImageView.kf.setImage(with: URL(string: "\(imagePrefix)\(movie.largeImage ?? "")"))
        var genreCounter = 0
        var currentGenres = [String]()
        movie.genreIDs.forEach { index in
            let genreName = genreList.filter({$0.id == index}).first?.name
            if genreCounter < 4 {
                currentGenres.append(genreName ?? "N/A")
            }
            genreCounter += 1
        }
        genresLabel.text = currentGenres.joined(separator: " | ")
        if movie.score.truncatingRemainder(dividingBy: 2.0) == 0.0 {
            for i in 0..<Int(movie.score)/2 {
                scoreStars[i].image = UIImage.init(systemName: "star.fill")
            }
        } else {
            for i in 0..<Int(movie.score)/2 {
                scoreStars[i].image = UIImage.init(systemName: "star.fill")
            }
            scoreStars[Int(movie.score/2)].image = UIImage.init(systemName: "star.leadinghalf.filled")
        }
        movieScore.text = "\(String(movie.score))"
    }
}
