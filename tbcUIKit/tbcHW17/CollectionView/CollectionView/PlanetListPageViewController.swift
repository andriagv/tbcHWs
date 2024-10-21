//
//  PlanetListPageViewController.swift
//  CollectionView
//
//  Created by Apple on 20.10.24.
//

import UIKit

class PlanetListPageViewController: UIViewController {
    
    let lable: UILabel = {
        let lable = UILabel()
        lable.text = "planets"
        lable.textAlignment = .center
        lable.tintColor = .white
        lable.font = UIFont.boldSystemFont(ofSize: 40)
        lable.textColor = .white
        lable.translatesAutoresizingMaskIntoConstraints = false

        return lable
    }()
    
    var planets: [Planet] = [
        Planet(image: UIImage(named: "mercury") ?? UIImage(), name: "Mercury", size: "74,800,000 km2", temperature: "167°C", mass: "33E0 kg", isFavorite: false),
        Planet(image: UIImage(named: "venus") ?? UIImage(), name: "Venus", size: "460,200,000 km2", temperature: "464°C", mass: "4,8E00 kg", isFavorite: false),
        Planet(image: UIImage(named: "earth") ?? UIImage(), name: "Earth", size: "510,100,000 km2", temperature: "15°C", mass: "5,97E321 kg", isFavorite: false),
        Planet(image: UIImage(named: "mars") ?? UIImage(), name: "Mars", size: "144,800,000 km2", temperature: "-65°C", mass: "6,42E00 kg", isFavorite: false),
        Planet(image: UIImage(named: "jupiter") ?? UIImage(), name: "Jupiter", size: "6,14800,000 km2", temperature: "-110°C", mass: "1,9E030 kg", isFavorite: false),
        Planet(image: UIImage(named: "uranus") ?? UIImage(), name: "Uranus", size: "8,083,100,000 km2", temperature: "-195°C", mass: "86,E530 kg", isFavorite: false),
        Planet(image: UIImage(named: "saturn") ?? UIImage(), name: "Saturn", size: "427,200,000 km2", temperature: "-139°C", mass: "568,0E0 kg", isFavorite: false)
    ]
    
    var sortedPlanets: [Planet] {
        planets.sorted { $0.isFavorite && !$1.isFavorite }
    }
    
    let uiView = UIView()
 

    let planetsCollectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        collectionLayout.itemSize = CGSize(width: 180, height: 220)
        collectionLayout.minimumLineSpacing = 10
        collectionLayout.minimumInteritemSpacing = 10
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.register(PlanetListPageCell.self, forCellWithReuseIdentifier: "PlanetListPageCell")
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collectionLayout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 50) 
                
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(hex: "#210D04")
        view.backgroundColor = UIColor(hex: "#210D04")
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(planetsCollectionView)
        view.addSubview(uiView)
        uiView.addSubview(lable)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        planetsCollectionView.dataSource = self
        planetsCollectionView.delegate = self
    
        NSLayoutConstraint.activate([
            uiView.topAnchor.constraint(equalTo: view.topAnchor),
            uiView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            uiView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            uiView.heightAnchor.constraint(equalToConstant: 100),
            
            planetsCollectionView.topAnchor.constraint(equalTo: uiView.topAnchor),
            planetsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            planetsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            planetsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            lable.centerXAnchor.constraint(equalTo: uiView.centerXAnchor),
            lable.bottomAnchor.constraint(equalTo: uiView.bottomAnchor)
            
        ])
    }
}

extension PlanetListPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        planets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetListPageCell", for: indexPath) as? PlanetListPageCell
        var planet = sortedPlanets[indexPath.row]
        
        cell?.removeAction = {
            planet.isFavorite.toggle()
            if let index = self.planets.firstIndex(where: { $0.name == planet.name }) {
                self.planets[index] = planet
            }
            collectionView.reloadData()
        }
        
        cell?.updateUI(with: planet)
        
        return cell ?? UICollectionViewCell()
    }
}
extension PlanetListPageViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = PlanetDetailsPageViewController()
        nextVC.planet = sortedPlanets[indexPath.row]
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}


#Preview() {
    PlanetListPageViewController()
}
