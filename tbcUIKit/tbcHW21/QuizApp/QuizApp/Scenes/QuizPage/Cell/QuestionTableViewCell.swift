// QuestionTableViewCell.swift
// QuizApp
//
// Created by Apple on 03.11.24.

import UIKit

final class QuestionTableViewCell: UITableViewCell {
    
    private let containerView = UIView()
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.layer.cornerRadius = 15
        containerView.backgroundColor = .white
        containerView.layer.shadowRadius = 12
        contentView.addSubview(containerView)
        
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .systemPurple
        label.textAlignment = .center
        containerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        selectionStyle = .none
    }
}
