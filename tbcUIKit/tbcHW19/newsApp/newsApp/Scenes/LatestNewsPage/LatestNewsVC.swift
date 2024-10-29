//
//  latestNewsVC.swift
//  newsApp
//
//  Created by Apple on 29.10.24.
//

import UIKit

final class LatestNewsVC: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .orange
        
        //tableView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        return tableView
    }()
    
    let viewModel = LatestNewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .purple
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.register(HotUpdatesVCTableViewCell.self, forCellReuseIdentifier: "HotUpdatesVCTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension LatestNewsVC: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsListcount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "HotUpdatesVCTableViewCell", for: indexPath) as? HotUpdatesVCTableViewCell {
            let news = viewModel.selectNews(at: indexPath.row)
            
            cell.backgroundColor = .red
            cell.configure(news: news)
            return cell
        }
        return  UITableViewCell()
    }
}

extension LatestNewsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let currentNews = viewModel.selectNews(at: indexPath.row)
        let nextVC = HotUpdatesVC()
        nextVC.news = currentNews
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

