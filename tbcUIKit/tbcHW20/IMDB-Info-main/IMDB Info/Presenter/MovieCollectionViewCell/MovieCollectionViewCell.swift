//
//  MovieCollectionViewCell.swift
//  IMDB Info
//
//  Created by Nika Topuria on 26.10.21.
//

import UIKit
import Kingfisher

final class MovieCollectionViewCell: UICollectionViewCell {

    private let imagePrefix = "https://image.tmdb.org/t/p/w500/"
    @IBOutlet private weak var mainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainImage.layer.cornerRadius = 5
    }
    
    func makeView(_ movie: Movie) {
        mainImage.kf.setImage(with: URL(string: "\(imagePrefix)\(movie.largeImage ?? "")"))
    }
}
