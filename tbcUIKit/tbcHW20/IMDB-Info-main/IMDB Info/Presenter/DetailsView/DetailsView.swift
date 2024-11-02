//
//  DetailsView.swift
//  DetailsView
//
//  Created by Nika Topuria on 20.10.21.
//

import UIKit
import Kingfisher

final class DetailsView: UIViewController {
    private let imagePrefix = "https://image.tmdb.org/t/p/w500/"
    @IBOutlet private var mainImage: UIImageView!
    @IBOutlet private var movieTitle: UILabel!
    @IBOutlet private var movieScore: UILabel!
    @IBOutlet private var backgroundImage: UIImageView!
    @IBOutlet private var movieDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.alpha = 0.2
    }
    
    func makeView(_ movie: Movie) {
        mainImage.kf.setImage(with: URL(string: "\(imagePrefix)\(movie.largeImage ?? "")"))
        backgroundImage.kf.setImage(with: URL(string: "\(imagePrefix)\(movie.largeImage ?? "")"))
        movieTitle.text = movie.movieTitle
        movieScore.text = "IMDB Score: \(String(movie.score))"
        movieDescription.text = "Description: \(movie.overview)"
    }
}
