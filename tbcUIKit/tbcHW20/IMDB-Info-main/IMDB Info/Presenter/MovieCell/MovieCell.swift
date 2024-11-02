//
//  MovieCell.swift
//  MovieCell
//
//  Created by Nika Topuria on 20.10.21.
//

import UIKit
import Kingfisher

final class MovieCell: UITableViewCell {
    private let imagePrefix = "https://image.tmdb.org/t/p/w500/"
    @IBOutlet private var listImageView: UIImageView!
    @IBOutlet private var movieTitle: UILabel!
    @IBOutlet private var movieScore: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieScore.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        movieTitle.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        listImageView.layer.cornerRadius = 10
    }

    
    func makeNew(_ movie: Movie) {
        listImageView.kf.setImage(with: URL(string: "\(imagePrefix)\(movie.listImage ?? "")"))
        movieTitle.text = movie.movieTitle
        movieScore.text = "\(String(movie.score))"
    }
}
