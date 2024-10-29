//
//  HotUpdatesVCTableViewCell.swift
//  newsApp
//
//  Created by Apple on 30.10.24.
//

import UIKit

class HotUpdatesVCTableViewCell: UITableViewCell {
    
    private var autorName = UILabel()
    private var newsData = UILabel()
    private var newsTitle = UILabel()
    private var meore = UILabel()
    private var newsImage = UIImageView()
    
    func configure(news: News) {
        newsData.text = news.newsData
        newsTitle.text = news.newsTitle
        meore.text = news.meore
        //newsImage
        }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setupUi()
    }
    
    private func setupUi() {
        contentView.addSubview(autorName)
        contentView.addSubview(newsData)
        contentView.addSubview(newsTitle)
        contentView.addSubview(meore)
        contentView.addSubview(newsImage)
        
        autorName.translatesAutoresizingMaskIntoConstraints = false
        newsData.translatesAutoresizingMaskIntoConstraints = false
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        meore.translatesAutoresizingMaskIntoConstraints = false
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        
        newsData.backgroundColor = .black
        
        NSLayoutConstraint.activate([
//            newsTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
//            newsTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            
            newsData.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            newsData.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

}
