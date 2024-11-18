//
//  UserCell.swift
//  UsersTesting
//
//  Created by Nino Godziashvili on 15.11.24.
//

import UIKit

class UserCell: UITableViewCell {
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let contactNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var userViewModel: UserViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        addShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(profileImageView)
        addSubview(userNameLabel)
        addSubview(contactNumberLabel)
        addSubview(emailLabel)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contactNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
            profileImageView.heightAnchor.constraint(equalToConstant: 60),
            
            userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            contactNumberLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
            contactNumberLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            contactNumberLabel.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: contactNumberLabel.bottomAnchor, constant: 8),
            emailLabel.leadingAnchor.constraint(equalTo: contactNumberLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: contactNumberLabel.trailingAnchor),
            emailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    private func addShadow() {
        layer.shadowOffset = CGSize(width: 1, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.25
    }
    
    func configure(with userVM: UserViewModel) {
        self.userViewModel = userVM
        
        userNameLabel.text = userVM.fullName
        contactNumberLabel.text = userVM.contactNumber
        emailLabel.text = userVM.email
        
        profileImageView.image = UIImage(named: "placeholder")
        if let url = userVM.thumbnailImageUrl {
            loadImage(from: url)
        }
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.profileImageView.image = UIImage(data: data)}
        }.resume()
    }
}

