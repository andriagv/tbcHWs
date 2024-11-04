//
//  AnswerVC.swift
//  QuizApp
//
//  Created by Apple on 03.11.24.
//
import UIKit

final class AnswerVC: UIViewController {
    
    private let viewModel: AnswerViewModel
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let Qview: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(hex: "#8E84FF")
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "Sen-Regular", size: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let questionNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Sen-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let navigateBackButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let answerCountLabel: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "#8E84FF")
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Sen-Regular", size: 17)
        button.layer.cornerRadius = 17
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(viewModel: AnswerViewModel, questionNumber: Int) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        questionNumberLabel.text = "Question \(questionNumber)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
        
        if let savedAnswer = viewModel.retrieveSavedAnswer() {
            displaySavedAnswer(savedAnswer)
        }
        updateAnswerCountLabel()
    }
    
    private func setupUI() {
        setupScrollView()
        setupBackButton()
        setupGradientBackground()
        makeButtonsAndAction()
        setupAnswerCountLabel()
    }
    
    private func setupScrollView() {
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        setupContentView()
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(questionLabel)
        contentView.addSubview(stackView)
        questionLabel.text = viewModel.question.question
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func makeButtonsAndAction() {
        let options = [viewModel.question.A, viewModel.question.B, viewModel.question.C, viewModel.question.D]
        for option in options {
            let button = createOptionButton(withText: option)
            button.addAction(UIAction(handler: { [weak self] _ in
                self?.optionSelected(button)
            }), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    private func setupAnswerCountLabel() {
        contentView.addSubview(answerCountLabel)
        
        NSLayoutConstraint.activate([
            answerCountLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 100),
            answerCountLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            answerCountLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            answerCountLabel.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
    
    private func updateAnswerCountLabel() {
        answerCountLabel.setTitle("Correct Answer \(viewModel.correctAnswersCount) / Incorrect \(viewModel.incorrectAnswersCount)", for: .normal)
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
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupBackButton() {
        navigateBackButton.addAction(UIAction(handler: { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigateBackButton)
    }
    
    private func setupNavigationBar() {
        
        let qViewBarButtonItem = UIBarButtonItem(customView: Qview)
        navigationItem.rightBarButtonItem = qViewBarButtonItem
        
        Qview.translatesAutoresizingMaskIntoConstraints = false
        Qview.widthAnchor.constraint(equalToConstant: 100).isActive = true
        Qview.heightAnchor.constraint(equalToConstant: 40).isActive = true
        Qview.addSubview(questionNumberLabel)
        questionNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        questionNumberLabel.centerXAnchor.constraint(equalTo: Qview.centerXAnchor).isActive = true
        questionNumberLabel.centerYAnchor.constraint(equalTo: Qview.centerYAnchor).isActive = true
    }
    
    private func createOptionButton(withText text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 49).isActive = true
        button.layer.cornerRadius = 12
        button.setTitleColor(UIColor(hex: "#2B0063"), for: .normal)
        button.titleLabel?.font = UIFont(name: "Sen-Regular", size: 15)
        button.contentHorizontalAlignment = .leading
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = UIColor(hex: "#2B0063")
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return button
        
    }
    
    private func optionSelected(_ sender: UIButton) {
        for case let button as UIButton in stackView.arrangedSubviews {
                button.isEnabled = false
            }
        guard let selectedAnswer = sender.title(for: .normal) else { return }
        
        viewModel.saveAnswer(selectedAnswer)
        //viewModel.canAnswer = false
        displaySavedAnswer(selectedAnswer)
        updateAnswerCountLabel()
    }
    
    private func displaySavedAnswer(_ answer: String) {
        for case let button as UIButton in stackView.arrangedSubviews {
            
            if button.title(for: .normal) == answer {
                button.backgroundColor = UIColor(hex: "#8E84FF")
                let image = (answer == viewModel.question.answer) ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "checkmark.circle")
                button.setImage(image, for: .normal)
            } else {
                button.backgroundColor = .white
                button.setImage(UIImage(systemName: "circle"), for: .normal)
            }
        }
    }
}
