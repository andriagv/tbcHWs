//
//  PlanetList.swift
//  testUiTableView
//
//  Created by Apple on 19.10.24.
//

import UIKit

class PlanetList: UIViewController {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var planets: [Planet] = [
        Planet(image: UIImage(named: "mars") ?? UIImage(), name: "Mars", size: "6,142E10 km2"),
        Planet(image: UIImage(named: "jupiter") ?? UIImage(), name: "Jupiter", size: "6,378,137 km2"),
        Planet(image: UIImage(named: "earth") ?? UIImage(), name: "Earth", size: "6,378,137 km2"),
        Planet(image: UIImage(named: "saturn") ?? UIImage(), name: "Saturn", size: "6,378,137 km2")
    ]
    
    struct Cells {
        static let planetCell = "PlanetCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Planets"
        configureTableView()
        titleAttributes()
        tableView.backgroundColor = UIColor(red: 33/255.0, green: 13/255.0, blue: 4/255.0, alpha: 1.0)
    }
    
    private func titleAttributes() {
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 179/255.0, green: 68/255.0, blue: 22/255.0, alpha: 1.0),
            .font: UIFont.systemFont(ofSize: 36, weight: .bold)
        ]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 200
        tableView.register(PlanetCell.self, forCellReuseIdentifier: Cells.planetCell)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension PlanetList: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.planetCell, for: indexPath) as! PlanetCell
        
        let planet = planets[indexPath.row]
        
        cell.set(planet: planet)
        cell.backgroundColor = UIColor(red: 33/255.0, green: 13/255.0, blue: 4/255.0, alpha: 1.0)

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentPlanet = planets[indexPath.row]
        let nextVC = PlanetDetals()
        nextVC.planet = currentPlanet
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
