//
//  RulesViewController.swift
//  EmojiRiddle
//
//  Created by Apple on 27.12.24.
//

import UIKit

final class RulesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 230/255, green: 245/255, blue: 255/255, alpha: 1.0)
        
        let titleLabel = UILabel()
        titleLabel.text = "📜 წესები"
        titleLabel.font = UIFont(name: "Avenir-Heavy", size: 28)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor(red: 50/255, green: 80/255, blue: 120/255, alpha: 1.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let rulesLabel = UILabel()
        rulesLabel.text = """
        გამარჯობა ჩემო მოთამაშე! სანამ თამაშს დაიწყებ, გაეცანი წესებს:

        1. აირჩიე მიმართულება, რომელზეც გინდა ქვიზი წეროთ.
        2. სულ არის N კითხვის რაოდენობა, თითო კითხვის მაქსიმალური შეფასება — 1 ქულა.
        3. პირველ ჯერზე თუ ვერ გამოიცანი, მიიღებ მინიშნებას და მეორე შანსს. ამ შემთხვევაში 0.5 ქულა დაგერიცხება.
        4. თუ ორივე შემთხვევაშიც ვერ გამოიცანი, 0 ქულა დაგერიცხება.
        5. ყველა კითხვაზე პასუხის შემდეგ, თუ მაქსიმალური ქულების 80%-ს მიაღწევ, იგებ თამაშს!
        """
        rulesLabel.font = UIFont(name: "Avenir-Medium", size: 18)
        rulesLabel.numberOfLines = 0
        rulesLabel.textAlignment = .left
        rulesLabel.textColor = UIColor(red: 30/255, green: 60/255, blue: 90/255, alpha: 1.0)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.white
        backgroundView.layer.cornerRadius = 15
        backgroundView.layer.shadowColor = UIColor.black.cgColor
        backgroundView.layer.shadowOpacity = 0.2
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 5)
        backgroundView.layer.shadowRadius = 10
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, rulesLabel])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.addSubview(stackView)
        view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20)
        ])
    }
}

