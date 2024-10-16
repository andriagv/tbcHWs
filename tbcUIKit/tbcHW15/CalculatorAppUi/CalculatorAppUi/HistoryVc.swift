//
//  HistoryVc.swift
//  CalculatorAppUi
//
//  Created by Apple on 16.10.24.
//

import UIKit

class HistoryVc: UIViewController {


    var textView: UITextView?
    var historyText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "History"
        setupTextView()
    }

    private func setupTextView() {
        textView = UITextView()
        guard let textView = textView else { return }
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.text = historyText
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    // ამას ვიცი რო ერჯერადად ვიყენებ მაგრამ სამომავლო დააბდეიტებისთვის ვტოვებ
    func updateHistory(with newEntry: String) {
        historyText += newEntry + "\n"
        textView?.text = historyText
    }
}

#Preview {
    HistoryVc()
}
//
