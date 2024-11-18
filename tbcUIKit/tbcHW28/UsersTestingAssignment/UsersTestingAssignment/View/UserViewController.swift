//
//  UserViewController.swift
//  UsersTesting
//
//  Created by Nino Godziashvili on 15.11.24.
//

import UIKit

class UserViewController: UIViewController {
    
    private var usersVM: [UserViewModel] = []
    private let cellIdentifier = "UserCell"
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(red: 0.862, green: 0.933, blue: 1, alpha: 1)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchUsersAPICall()
    }
    
    private func setupView() {
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = UIColor(red: 0.862, green: 0.933, blue: 1, alpha: 1)
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UserCell.self, forCellReuseIdentifier: cellIdentifier)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchUsersAPICall() {
        let totalUserLimit = Int.random(in: 5 ... 100)
        
        NetworkManager.sharedInstance.fetchUsers(withLimit: totalUserLimit) { [weak self] (users) in
            self?.usersVM = users.map { UserViewModel(user: $0) }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.navigationItem.title = "Users (\(users.count))"
            }
        }
    }
}

extension UserViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let userCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UserCell else {
            fatalError("\(cellIdentifier)")
        }
        userCell.configure(with: usersVM[indexPath.row])
        return userCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


