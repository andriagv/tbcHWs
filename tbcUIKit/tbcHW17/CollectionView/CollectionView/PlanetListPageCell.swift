//
//  PlanetListPageCell.swift
//  CollectionView
//
//  Created by Apple on 20.10.24.
//

import UIKit

final class PlanetListPageCell: UICollectionViewCell {
    
    var removeAction: (() -> Void)?
    
    let planetName: UILabel = {
        let name = UILabel()
        name.textAlignment = .center
        name.font = UIFont.systemFont(ofSize: 24)
        name.textColor = .white
        name.font = UIFont.boldSystemFont(ofSize: 35)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let planetArea: UILabel = {
        let area = UILabel()
        area.textColor = .white
        area.textAlignment = .center
        area.translatesAutoresizingMaskIntoConstraints = false
        return area
    }()
    
    let planetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let isFavoriteBurron: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        action()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(with planet: Planet) {
        planetName.text = planet.name
        planetArea.text = planet.size
        planetImageView.image = planet.image
        let favoriteIcon = planet.isFavorite ? "star.fill" : "star"
        isFavoriteBurron.setImage(UIImage(systemName: favoriteIcon), for: .normal)
    }
    
    func action() {
        isFavoriteBurron.addAction(UIAction(handler: { [weak self]  action in
            self?.removeAction?()
        }), for: .touchUpInside)
    }
    
    private func setupCell() {
        contentView.addSubview(planetImageView)
        contentView.addSubview(planetName)
        contentView.addSubview(planetArea)
        contentView.addSubview(isFavoriteBurron)
        
        NSLayoutConstraint.activate([
            planetImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            planetImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            planetImageView.widthAnchor.constraint(equalTo: heightAnchor),
            
            planetName.topAnchor.constraint(equalTo: planetImageView.bottomAnchor, constant: 8),
            planetName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            planetName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            isFavoriteBurron.centerYAnchor.constraint(equalTo: planetName.centerYAnchor),
            isFavoriteBurron.trailingAnchor.constraint(equalTo: planetName.trailingAnchor, constant: 5),
            isFavoriteBurron.widthAnchor.constraint(equalToConstant: 15),
            isFavoriteBurron.heightAnchor.constraint(equalToConstant: 15),
            
            planetArea.topAnchor.constraint(equalTo: planetName.bottomAnchor, constant: 4),
            planetArea.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            planetArea.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            planetArea.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}

