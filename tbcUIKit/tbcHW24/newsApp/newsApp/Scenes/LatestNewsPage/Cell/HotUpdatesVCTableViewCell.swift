//
//  HotUpdatesVCTableViewCell.swift
//  newsApp
//
//  Created by Apple on 30.10.24.
//

import UIKit
import DateFormatterService

final class HotUpdatesVCTableViewCell: UITableViewCell {
    
    private let viewModel = LatestNewsViewModel()
    private let dateFormatterService = DateFormatterService()
    
    // MARK: - UI Elements
    
    private let newsImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito", size: 12)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Nunito", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito", size: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        contentView.addSubview(newsImageView)
        newsImageView.addSubview(titleLabel)
        newsImageView.addSubview(authorLabel)
        newsImageView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            titleLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor, constant: 10),
            
            authorLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: 10),
            authorLabel.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: -10),
            
            dateLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: -10),
            dateLabel.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: -10)
        ])
    }
    
    //https://forums.swift.org/t/datatask-in-a-loop/64807
    func configure(with article: NewsArticle) {
        titleLabel.text = article.title
        authorLabel.text = "\(article.author)"
        dateLabel.text = "\(dateFormatterService.formatDate(article.publishedAt))"
        if let url = URL(string: article.imageUrl) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    DispatchQueue.main.async { [weak self] in
                        self?.newsImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }
}

