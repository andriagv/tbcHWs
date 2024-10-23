//
//  PlanetDetals.swift
//  testUiTableView
//
//  Created by Apple on 19.10.24.
//


import UIKit

class PlanetDetals: UIViewController {
    
    var planet: Planet?
    
    private let planetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let planetName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textColor = .orange
        return label
    }()
    
    private let planetSizeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .gray
        label.layer.borderWidth = 1.5
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        return label
    }()
    
    private let mas: UILabel = {
        let mas = UILabel()
        mas.textAlignment = .center
        mas.font = UIFont.systemFont(ofSize: 24)
        mas.textColor = .gray
        mas.layer.borderWidth = 1.5
        mas.layer.borderColor = UIColor.white.cgColor
        mas.layer.cornerRadius = 10
        mas.layer.masksToBounds = true
        return mas
    }()
    
    private let temp: UILabel = {
        let temp = UILabel()
        temp.textAlignment = .center
        temp.font = UIFont.systemFont(ofSize: 24)
        temp.textColor = .gray
        temp.layer.borderWidth = 1.5
        temp.layer.borderColor = UIColor.white.cgColor
        temp.layer.cornerRadius = 10
        temp.layer.masksToBounds = true
        return temp
    }()
    
    private let infoStackContainer: UIStackView = {
        let infoStackContainer = UIStackView()
        infoStackContainer.axis = .vertical
        infoStackContainer.spacing = 15
        infoStackContainer.translatesAutoresizingMaskIntoConstraints = false
        infoStackContainer.distribution = .fillEqually
        
        return infoStackContainer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        setupLayout()
        setupInfoStackContainer()
        
        view.backgroundColor = UIColor(red: 33/255.0, green: 13/255.0, blue: 4/255.0, alpha: 1.0)
        
        planetName.text = planet?.name
        planetImageView.image = planet?.image
        planetSizeLabel.text = "area: \(planet?.size ??  "")"
        mas.text = "Mass: \(planet?.mass ??  "")"
        temp.text = "temperature: \(planet?.temperature ??  "")"
        
    }
    
    private func setupLayout() {
        view.addSubview(planetImageView)
        view.addSubview(planetName)
        view.addSubview(planetSizeLabel)
        view.addSubview(mas)
        view.addSubview(temp)
        view.addSubview(planetSizeLabel)
        
        planetImageView.translatesAutoresizingMaskIntoConstraints = false
        planetName.translatesAutoresizingMaskIntoConstraints = false
        planetSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        mas.translatesAutoresizingMaskIntoConstraints = false
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            planetImageView.widthAnchor.constraint(equalToConstant: 280),
            planetImageView.heightAnchor.constraint(equalTo: planetImageView.widthAnchor),
            planetName.bottomAnchor.constraint(equalTo: planetImageView.topAnchor, constant: -50),
            planetName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupInfoStackContainer() {
        view.addSubview(infoStackContainer)
        
        infoStackContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        infoStackContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        infoStackContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        infoStackContainer.topAnchor.constraint(equalTo: planetImageView.bottomAnchor, constant: 40).isActive = true
        infoStackContainer.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        infoStackContainer.addArrangedSubview(mas)
        infoStackContainer.addArrangedSubview(temp)
        infoStackContainer.addArrangedSubview(planetSizeLabel)
    }
}

