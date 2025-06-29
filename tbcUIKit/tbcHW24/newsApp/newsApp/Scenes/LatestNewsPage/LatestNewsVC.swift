//
//  latestNewsVC.swift
//  newsApp
//
//  Created by Apple on 29.10.24.
//

import UIKit
import DateFormatterService

final class LatestNewsVC: UIViewController {
    
    private let viewModel = LatestNewsViewModel()
    
    // MARK: - UI Elements
    private let formatter: DateFormatting
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Latest News"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    init( formatter: DateFormatting = DateFormatterService()) {
        self.formatter = formatter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchNews()
        view.backgroundColor = .white
    }
    
    // MARK: - Setup Methods
    
    private func fetchNews() {
        viewModel.onDataUpdated = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.fetchNews()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        view.addSubview(titleLabel)
        
        tableView.register(HotUpdatesVCTableViewCell.self, forCellReuseIdentifier: "HotUpdatesVCTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 60),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension LatestNewsVC: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfArticles()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HotUpdatesVCTableViewCell", for: indexPath) as? HotUpdatesVCTableViewCell else {
            return UITableViewCell()
        }
        
        let article = viewModel.article(at: indexPath.row)
        configure(with: article)
        cell.clipsToBounds = true
        
        func configure(with article: NewsArticle) {
            cell.titleLabel.text = article.title
            cell.authorLabel.text = "\(article.author)"
            cell.dateLabel.text = "\(formatter.formatDate(article.publishedAt))"
            if let url = URL(string: article.imageUrl) {
                URLSession.shared.dataTask(with: url) { data, _, _ in
                    if let data = data {
                        DispatchQueue.main.async {
                            cell.newsImageView.image = UIImage(data: data)
                        }
                    }
                }.resume()
            }
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150 // სელის სასურველი სიმაღლე
    }
}

extension LatestNewsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.article(at: indexPath.row)
        let articleViewModel = HotUpdatesViewModel(article: article)
        let nextVC = HotUpdatesVC(viewModel: articleViewModel)
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

