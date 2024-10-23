//
//  PlanetCell.swift
//
//  Created by Apple on 19.10.24.
//

import UIKit

class PlanetCell: UITableViewCell {
    
    let planetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let planetName: UILabel = {
        let planetName = UILabel()
        planetName.numberOfLines = 0
        planetName.adjustsFontSizeToFitWidth = true
        planetName.font = UIFont.boldSystemFont(ofSize: 36)
        planetName.textColor = .white
        
        return planetName
    }()
    
    let planetSizeLabel: UILabel = {
        let planetSizeLabel = UILabel()
        planetSizeLabel.numberOfLines = 0
        planetSizeLabel.adjustsFontSizeToFitWidth = true
        planetSizeLabel.textColor = .gray
        
        return planetSizeLabel
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Details", for: .normal)
        
        let image = UIImage(named: "right")
        button.setImage(image, for: .normal)
        button.setTitle("Details", for: .normal)
        
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configurCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurCell() {
        contentView.addSubview(planetImageView)
        contentView.addSubview(planetName)
        contentView.addSubview(button)
        contentView.addSubview(planetSizeLabel)
        
        planetImageView.translatesAutoresizingMaskIntoConstraints = false
        planetName.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        planetSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            planetImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            planetImageView.heightAnchor.constraint(equalToConstant: 132),
            planetImageView.widthAnchor.constraint(equalTo: planetImageView.heightAnchor),
            
            planetName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 36),
            planetName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 20),
            button.widthAnchor.constraint(equalTo: button.heightAnchor),
            
            planetSizeLabel.topAnchor.constraint(equalTo: planetName.bottomAnchor, constant: 1),
            planetSizeLabel.leadingAnchor.constraint(equalTo: planetName.leadingAnchor),
            planetSizeLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -8),
        ])
    }
    
    func set(planet: Planet) {
        planetName.text = planet.name
        planetImageView.image = planet.image
        planetSizeLabel.text = planet.size
    }
}
