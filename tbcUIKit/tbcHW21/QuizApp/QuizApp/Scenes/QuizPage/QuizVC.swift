// QuizVC.swift
// QuizApp
//
// Created by Apple on 03.11.24.

import UIKit
import Foundation

final class QuizVC: UIViewController {
    
    private let viewModel = QuizViewModel()
    private let tableView = UITableView()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "#8E84FF")
        button.tintColor = .white
        button.setTitle("Reset", for: .normal)
        button.titleLabel?.font = UIFont(name: "Sen-Regular", size: 17)
        button.layer.cornerRadius = 17
        button.layer.borderColor = CGColor(gray: 3, alpha: 1)
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Quiz"
        label.textColor = .white
        label.font = UIFont(name: "Sen-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadQuestions()
        setupResetButton()
        setupQuizLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGradientBackground()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(QuestionTableViewCell.self, forCellReuseIdentifier: "QuestionTableViewCell")
        tableView.separatorStyle = .none
    }
    
    private func setupResetButton() {
        resetButton.addAction(UIAction(handler: { [weak self]  action in
            self?.resetAnswers()
        }), for: .touchUpInside)
        
        view.addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            resetButton.widthAnchor.constraint(equalToConstant: 66),
            resetButton.heightAnchor.constraint(equalToConstant: 34),
            resetButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        ])
    }
    
    private func setupQuizLabel() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
    }
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(hex: "#060B26", alpha: 0.9).cgColor,
            UIColor(hex: "#1A1F37", alpha: 0.5).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = view.bounds
        
        let gradientBackgroundView = UIView(frame: view.bounds)
        gradientBackgroundView.layer.insertSublayer(gradientLayer, at: 0)
        
        tableView.backgroundView = gradientBackgroundView
        tableView.backgroundColor = .clear
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func loadQuestions() {
        viewModel.loadQuestions { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func resetAnswers() {
        print("ishleba")
        viewModel.resetAllAnswers()
        tableView.reloadData() 
    }
}

extension QuizVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfQuestions()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as? QuestionTableViewCell else {
            return UITableViewCell()
        }
        
        cell.label.text = "Question \(indexPath.row + 1)"
        cell.label.font = UIFont(name: "Sen-Regular", size: 15)
        cell.label.textColor = UIColor(hex: "#2B0063")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedQuestion = viewModel.question(at: indexPath.row)
        let answerViewModel = AnswerViewModel(question: selectedQuestion)
        let answerVC = AnswerVC(viewModel: answerViewModel, questionNumber: indexPath.row + 1)
        navigationController?.pushViewController(answerVC, animated: true)
    }
}
