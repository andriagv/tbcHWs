//
//  PlanetCell.swift
//  axali
//
//  Created by Apple on 18.10.24.
//

import UIKit

class PlanetCell: UITableViewCell {
    
    let someLbl = UILabel()
    
    let planetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("det", for: .normal)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configurCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    func configurCell() {
        contentView.addSubview(planetImageView)
        contentView.addSubview(someLbl)
        contentView.addSubview(button)
        
        planetImageView.translatesAutoresizingMaskIntoConstraints = false
        planetImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        planetImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        planetImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        planetImageView.widthAnchor.constraint(equalTo: planetImageView.heightAnchor).isActive = true
        
        someLbl.translatesAutoresizingMaskIntoConstraints = false
        someLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        someLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        someLbl.textColor = .white
        
        
        button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

    }
    
    func set(planet: Planet) {
        someLbl.text = planet.name
        planetImageView.image = planet.image
    }
}
