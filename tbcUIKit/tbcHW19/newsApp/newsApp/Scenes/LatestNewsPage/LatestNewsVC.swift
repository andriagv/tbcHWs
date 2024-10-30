//
//  latestNewsVC.swift
//  newsApp
//
//  Created by Apple on 29.10.24.
//

import UIKit

final class LatestNewsVC: UIViewController {
    
    let viewModel = LatestNewsViewModel()
    // MARK: - UI Elements
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
        cell.configure(with: article)
        cell.clipsToBounds = true
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
