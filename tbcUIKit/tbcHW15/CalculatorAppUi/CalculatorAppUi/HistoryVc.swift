//
//  HistoryVc.swift
//  CalculatorAppUi
//
//  Created by Apple on 23.10.24.
//

import UIKit

class HistoryVc: UIViewController {
    
    var isDarkMode = false
    
    var textView: UITextView?
    
    var historyText: String = ""
    
    private let navigateToCalculaotPageButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .regular)
        button.setImage(UIImage(systemName: "arrow.left.circle", withConfiguration: config), for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = isDarkMode ? UIColor(hex: "#1E1E1E") :  .white
    }
    
    private func setupUI() {
        title = "History"
        view.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
        view.backgroundColor = isDarkMode ? .systemFill : .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: isDarkMode ? UIColor.white : UIColor.black
        ]
        navigationController?.navigationBar.tintColor = isDarkMode ? .white : .black
        setupTextView()
        setupNavigateToCalculatorPageButton()
    }
    private func setupNavigateToCalculatorPageButton() {
        view.addSubview(navigateToCalculaotPageButton)
        
        NSLayoutConstraint.activate([
            navigateToCalculaotPageButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 47),
            navigateToCalculaotPageButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            navigateToCalculaotPageButton.heightAnchor.constraint(equalTo: navigateToCalculaotPageButton.widthAnchor),
            navigateToCalculaotPageButton.widthAnchor.constraint(equalToConstant: 28)
        ])
        
        navigateToCalculaotPageButton.tintColor = isDarkMode ? .white : .black
        navigateToCalculaotPageButton.addAction(UIAction(handler: { [weak self] action in
            self?.navigateToCalculatorPage()
        }), for: .touchUpInside)
    }
    
    private func navigateToCalculatorPage() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupTextView() {
        textView = UITextView()
        guard let textView = textView else { return }
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.text = historyText
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 10)
        textView.textAlignment = .right
        textView.backgroundColor = .clear
 
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
    
    func updateHistory(with newEntry: String) {
        historyText += newEntry + "\n"
        textView?.text = historyText
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
