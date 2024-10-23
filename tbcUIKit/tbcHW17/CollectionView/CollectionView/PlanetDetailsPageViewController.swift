//
//  PlanetDetailsPageViewController.swift
//  CollectionView
//
//  Created by Apple on 20.10.24.
//

import UIKit

final class PlanetDetailsPageViewController: UIViewController {
    
    var planet: Planet?
    
//    var planetIndex: Int = 0
    
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
    
    private let isFavoriteBurron: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let navigateBackButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.isEnabled = true
        button.setImage(UIImage(named: "left"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#210D04")
        setupUI()
        infoPlanet()
        setupBackButton()
    }
    
  
    
    private func setupUI() {
        setupLayout()
        setupInfoStackView()
       // action()
    }
  
//    func action() {
//        isFavoriteBurron.addAction(UIAction(handler: { action in
//            self.removeAction()
//        }), for: .touchUpInside)
//    }
//    
//    func removeAction() {
//        guard var unwrappedPlanet = planet else { return }
//        if unwrappedPlanet.isFavorite == true {
//            unwrappedPlanet.isFavorite = false
//        } else {
//            unwrappedPlanet.isFavorite = true
//        }
//        let nextVC = PlanetListPageViewController()
//        nextVC.planets[planetIndex] = unwrappedPlanet
//        
//        let dd = PlanetListPageCell()
//        dd.updateUI(with: unwrappedPlanet)
//
//    }
    
    private func infoPlanet() {
        planetName.text = planet?.name
        planetImageView.image = planet?.image
        planetSizeLabel.text = "\(planet?.size ??  "")    "
        planetMass.text = "\(planet?.mass ??  "")    "
        planetTemperature.text = "\(planet?.temperature ??  "")    "
    }
    
    private func setupBackButton() {
        navigateBackButton.addAction(UIAction(handler: { [weak self] _ in
            self?.navigateBack()
        }), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigateBackButton)
    }
    private func navigateBack() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupLayout(){
        view.addSubview(planetImageView)
        view.addSubview(planetName)
        view.addSubview(infoStackView)
        //view.addSubview(isFavoriteBurron)
        
//        let favoriteBarButtonItem = UIBarButtonItem(customView: isFavoriteBurron)
//        navigationItem.rightBarButtonItem = favoriteBarButtonItem
        
        planetImageView.translatesAutoresizingMaskIntoConstraints = false
        planetName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            planetName.bottomAnchor.constraint(equalTo: planetImageView.topAnchor, constant: -50),
            planetName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            
//            isFavoriteBurron.centerYAnchor.constraint(equalTo: planetName.centerYAnchor),
//            isFavoriteBurron.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            isFavoriteBurron.widthAnchor.constraint(equalToConstant: 50),
            isFavoriteBurron.heightAnchor.constraint(equalToConstant: 50),
            
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

