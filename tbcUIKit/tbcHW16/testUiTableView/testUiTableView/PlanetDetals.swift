//
//  PlanetDetals.swift
//  testUiTableView
//
//  Created by Apple on 19.10.24.
//


import UIKit

class PlanetDetals: UIViewController {
    var planet: Planet?

    let planetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let planetName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textColor = .white
        return label
    }()
    
    let planetSizeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .gray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupLayout()
        
        view.backgroundColor = UIColor(red: 33/255.0, green: 13/255.0, blue: 4/255.0, alpha: 1.0)
        planetName.text = planet?.name
        planetImageView.image = planet?.image
        planetSizeLabel.text = planet?.size
    }
    
    func setupLayout() {
        view.addSubview(planetImageView)
        view.addSubview(planetName)
        view.addSubview(planetSizeLabel)
        
        planetImageView.translatesAutoresizingMaskIntoConstraints = false
        planetName.translatesAutoresizingMaskIntoConstraints = false
        planetSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            planetImageView.widthAnchor.constraint(equalToConstant: 280),
            planetImageView.heightAnchor.constraint(equalTo: planetImageView.widthAnchor),
            
            planetName.bottomAnchor.constraint(equalTo: planetImageView.topAnchor, constant: -50),
            planetName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            planetSizeLabel.topAnchor.constraint(equalTo: planetName.bottomAnchor, constant: 10),
            planetSizeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

