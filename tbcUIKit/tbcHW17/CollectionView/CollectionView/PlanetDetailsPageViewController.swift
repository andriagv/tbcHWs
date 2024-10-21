//
//  PlanetDetailsPageViewController.swift
//  CollectionView
//
//  Created by Apple on 20.10.24.
//

import UIKit

final class PlanetDetailsPageViewController: UIViewController {

    var planet: Planet?

    private lazy var infoStackView: UIStackView = createStackView(axis: .vertical, distribution: .fillEqually, spacing: 30, borderWidth: 0)
    private lazy var areaStackView: UIStackView = createStackView()
    private lazy var temperatureStackView: UIStackView = createStackView()
    private lazy var massStackView: UIStackView = createStackView()
    
    private lazy var planetSizeLabel: UILabel = createLable()
    private lazy var planetTemperature: UILabel = createLable()
    private lazy var planetMass: UILabel = createLable()
    
    private var stringSize = UILabel()
    private var stringTemperature = UILabel()
    private var stringMass = UILabel()
    
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
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#210D04")
        setupUI()
        infoPlanet()
    }
    
    private func setupUI() {
        setupLayout()
        setupInfoStackView()
    }
    
    private func infoPlanet() {
        planetName.text = planet?.name
        planetImageView.image = planet?.image
        planetSizeLabel.text = "\(planet?.size ??  "")    "
        planetMass.text = "\(planet?.mass ??  "")    "
        planetTemperature.text = "\(planet?.temperature ??  "")    "
    }
    
    private func setupLayout(){
        view.addSubview(planetImageView)
        view.addSubview(planetName)
        view.addSubview(infoStackView)
        
        planetImageView.translatesAutoresizingMaskIntoConstraints = false
        planetName.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            
            planetName.bottomAnchor.constraint(equalTo: planetImageView.topAnchor, constant: -50),
            planetName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            planetImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 158),
            planetImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            planetImageView.heightAnchor.constraint(equalTo: planetImageView.widthAnchor),
            
            infoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            infoStackView.heightAnchor.constraint(equalTo: infoStackView.widthAnchor, multiplier: 0.6),
            infoStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23)
        ])
    }
    
    private func setupInfoStackView() {
        stringSize.text = "  Area"
        stringTemperature.text = "  Temperature"
        stringMass.text = "  Mass"
        stringSize.textColor = .white
        stringTemperature.textColor = .white
        stringMass.textColor = .white
        
        infoStackView.addArrangedSubview(areaStackView)
        infoStackView.addArrangedSubview(temperatureStackView)
        infoStackView.addArrangedSubview(massStackView)
        
        areaStackView.addArrangedSubview(stringSize)
        areaStackView.addArrangedSubview(planetSizeLabel)
        
        temperatureStackView.addArrangedSubview(stringTemperature)
        temperatureStackView.addArrangedSubview(planetTemperature)
        
        massStackView.addArrangedSubview(stringMass)
        massStackView.addArrangedSubview(planetMass)
    }
    
    private func createStackView(axis: NSLayoutConstraint.Axis = .horizontal, distribution: UIStackView.Distribution = .equalSpacing, spacing: CGFloat = 0, borderWidth: CGFloat = 1.5) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = .fill
        stackView.distribution = distribution
        stackView.spacing = spacing
        stackView.layer.borderWidth = borderWidth
        stackView.layer.borderColor = UIColor.gray.cgColor
        stackView.layer.cornerRadius = 10
        stackView.layer.masksToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func createLable() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

