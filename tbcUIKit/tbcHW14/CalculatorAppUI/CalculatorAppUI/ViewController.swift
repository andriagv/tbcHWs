//
//  ViewController.swift
//  CalculatorAppUI
//
//  Created by Apple on 13.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLable = UILabel()
    var stakView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuretitleLable()
        configureStackView()
        
    }
    
    func configureStackView() {
        view.addSubview(stakView)
        stakView.axis = .vertical
        stakView.distribution = .fillEqually
        stakView.spacing = 20
        
        setStackViewConstraints()
        addButtonsToStackView()
        
        
    }
    
    func addButtonsToStackView() {
        let numberOfButtons = 5
        
        for i in 1...numberOfButtons {
            let button = SurveyButton()
            button.setTitle("\(i)", for: .normal)
            stakView.addArrangedSubview(button)
        }
    }
    
    func setStackViewConstraints() {
        stakView.translatesAutoresizingMaskIntoConstraints = false
        stakView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 30).isActive = true
        stakView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        stakView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        stakView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        
    }
    
    func configuretitleLable() {
        view.addSubview(titleLable)
        titleLable.text = "ok"
        titleLable.font = UIFont.boldSystemFont(ofSize: 36)
        titleLable.textAlignment = .center
        titleLable.numberOfLines = 0
        titleLable.adjustsFontSizeToFitWidth = true
        setTitleLableConstraints()
    }
    
    func setTitleLableConstraints() {
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        titleLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    

}
#Preview {
    ViewController()
}
