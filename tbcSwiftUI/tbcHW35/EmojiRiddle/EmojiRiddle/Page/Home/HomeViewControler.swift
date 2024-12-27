//
//  HomeViewControler.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//

import UIKit
import izziGradient
import SwiftUI

final class HomeViewControler: UIViewController {
    
    let gradientView = IzziLinearGradient()
    let viewModel = HomePageViewModel()
    
    lazy var filmButton = makeButton(title: "ფილმები")
    lazy var bookButton = makeButton(title: "წიგნები")
    lazy var animeButton = makeButton(title: "ანიმეები")
    
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var vstack: UIStackView = {
        let vstack = UIStackView()
        vstack.translatesAutoresizingMaskIntoConstraints = false
        vstack.axis = .horizontal
        vstack.spacing = 10
        return vstack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        makeGradient()
        setupLabel()
        setupStackView()
        tapButton()
    }
    
    private func setupLabel() {
        gradientView.addSubview(titleLabel)
        gradientView.addSubview(label)
        
        
        label.text = "აირჩიე კატეგორია"
        titleLabel.text = "დააგროვე ქულათა 80% და გაიმარჯვე"
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
    
    private func setupStackView() {
        view.addSubview(vstack)
        vstack.addArrangedSubview(filmButton)
        vstack.addArrangedSubview(bookButton)
        vstack.addArrangedSubview(animeButton)
        
        NSLayoutConstraint.activate([
            vstack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vstack.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        ])
    }
    
    private func tapButton() {
        filmButton.addAction(UIAction(handler: { [weak self] action in
            self?.action(type: Type.film) // განვსაზღვრეთ სრული კონტექსტი
        }), for: .touchUpInside)
        
        bookButton.addAction(UIAction(handler: { [weak self] action in
            self?.action(type: Type.book) // განვსაზღვრეთ სრული კონტექსტი
        }), for: .touchUpInside)
        
        animeButton.addAction(UIAction(handler: { [weak self] action in
            self?.action(type: Type.anime) // განვსაზღვრეთ სრული კონტექსტი
        }), for: .touchUpInside)
    }
    
    
    //    private func Action(type: Type) {
    //        let selectQuestions = viewModel.returnSelectQuestions(type: type)
    //        let vc = UIHostingController(rootView: QuestionListView(selectQuestions: selectQuestions))
    //        navigationController?.pushViewController(vc, animated: true)
    //    }
    private func action(type: Type) {
        let selectQuestions = viewModel.returnSelectQuestions(type: type)
        let questionListView = QuestionListView(viewModel: QuestionListViewModel(questions: selectQuestions))
        let vc = UIHostingController(rootView: questionListView)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func makeButton(title: String) -> UIButton {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(title, for: .normal)
        return btn
    }
    
    private func makeGradient() {
        
        view.addSubview(gradientView)
        
        gradientView.gradientColors = [
            UIColor(red: 0.6, green: 0.8, blue: 0.9, alpha: 1.0),
            UIColor(red: 0.3, green: 0.6, blue: 0.9, alpha: 1.0),
            UIColor(red: 0.5, green: 0.7, blue: 0.8, alpha: 1.0)
        ]
        gradientView.colorLocations = [0.25, 0.75, 1.0]
        
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


#Preview() {
    UINavigationController(rootViewController: HomeViewControler())
}
