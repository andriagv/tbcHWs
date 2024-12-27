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
    var ruleButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("წესები", for: .normal)
        return btn
    }()
    
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
        ruleBtbsetup()
    }
    
    private func setupLabel() {
        gradientView.addSubview(titleLabel)
        gradientView.addSubview(label)
        
        
        label.text = "აირჩიე კატეგორია:"
        titleLabel.text = "თამაშს დაიწყებამდე გაეცანი წესებს"
        
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
            self?.action(type: Type.film)
        }), for: .touchUpInside)
        
        bookButton.addAction(UIAction(handler: { [weak self] action in
            self?.action(type: Type.book)
        }), for: .touchUpInside)
        
        animeButton.addAction(UIAction(handler: { [weak self] action in
            self?.action(type: Type.anime)
        }), for: .touchUpInside)
    }
    
    private func action(type: Type) {
        let selectQuestions = viewModel.returnSelectQuestions(type: type)
        let vc1 = QuestionListViewModel(selectQuestions: selectQuestions)
        let questionListView = QuestionListView(viewModel: vc1)
        let vc = UIHostingController(rootView: questionListView)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func makeButton(title: String) -> UIButton {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        btn.layer.borderColor = UIColor.systemBlue.cgColor.copy(alpha: 0.5)
        btn.layer.borderWidth = 2.0
        btn.layer.cornerRadius = 20.0
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
    
    private func ruleBtbsetup() {
        gradientView.addSubview(ruleButton)
       
        ruleButton.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 28)
        
        NSLayoutConstraint.activate([
            ruleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ruleButton.topAnchor.constraint(equalTo: vstack.bottomAnchor, constant: 20)
        ])
        ruleBtnAction()
    }
    
    private func ruleBtnAction() {
        ruleButton.addAction(UIAction(handler: { [weak self] _ in
            let vc = RulesViewController()
            
            vc.modalPresentationStyle = .pageSheet
            if let sheet = vc.sheetPresentationController {
                sheet.detents = [
                    .custom { context in context.maximumDetentValue * 0.7 }
                ]
                sheet.prefersGrabberVisible = true
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            }
            
            self?.present(vc, animated: true)
        }), for: .touchUpInside)
    }
}


#Preview() {
    UINavigationController(rootViewController: HomeViewControler())
}
