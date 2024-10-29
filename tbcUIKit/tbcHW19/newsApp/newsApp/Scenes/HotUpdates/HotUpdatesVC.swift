//
//  HotUpdatesVC.swift
//  newsApp
//
//  Created by Apple on 30.10.24.
//

import UIKit

class HotUpdatesVC: UIViewController {
    
    var news: News?
    
    private var autorName = UILabel()
    private var newsData = UILabel()
    private var newsTitle = UILabel()
    private var meore = UILabel()
    private var newsImage = UIImageView()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        setupUI()
        
    }
    
    private func setupUI() {
        autorName.text = self.news?.autorName
        view.addSubview(autorName)
        autorName.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            autorName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            autorName.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
}
