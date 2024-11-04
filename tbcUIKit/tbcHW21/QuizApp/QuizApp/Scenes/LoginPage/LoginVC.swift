//
//  LoginVC.swift
//  QuizApp
//
//  Created by Apple on 03.11.24.
//

import UIKit
import Foundation

final class LoginVC: UIViewController {
    
    let viewModel = LoginViewModel()
    
    private let mainView = UIView()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle.badge.plus.fill")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.tintColor = .black
        image.heightAnchor.constraint(equalToConstant: 70).isActive = true
        image.widthAnchor.constraint(equalToConstant: 75).isActive = true
        return image
    }()
    
    private let viewImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 98).isActive = true
        view.widthAnchor.constraint(equalToConstant: 104).isActive = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 50
        return view
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "Sen-Regular", size: 14)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(hex: "#8E84FF")
        return button
    }()
    
    lazy var usernameLable = makeLable(lableTexr: "Username")
    lazy var passwordLable = makeLable(lableTexr: "Password")
    lazy var confirmPasswordLable = makeLable(lableTexr: "Confirm Password")
    
    lazy var usernameField = makeField(placeholder: "Enter username")
    lazy var passwordField = makeField(placeholder: "Enter password")
    lazy var confirmPasswordField = makeField(placeholder: "Enter password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        setupButtonAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupUI() {
        mainViewUi()
        setupVerticalStackView()
        setupGradientBackground()
    }
    
    private func mainViewUi() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainView)
        mainView.addSubview(viewImage)
        viewImage.addSubview(imageView)
        mainView.addSubview(verticalStackView)
        mainView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            viewImage.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 100),
            viewImage.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: viewImage.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: viewImage.centerYAnchor),
            
            verticalStackView.topAnchor.constraint(equalTo: viewImage.bottomAnchor, constant: 30),
            verticalStackView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20),
            verticalStackView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20),
            verticalStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            loginButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        setupVerticalStackView()
    }
    
    private func setupVerticalStackView() {
        verticalStackView.addArrangedSubview(usernameLable)
        verticalStackView.addArrangedSubview(usernameField)
        verticalStackView.addArrangedSubview(passwordLable)
        verticalStackView.addArrangedSubview(passwordField)
        verticalStackView.addArrangedSubview(confirmPasswordLable)
        verticalStackView.addArrangedSubview(confirmPasswordField)
        
        usernameLable.font = UIFont(name: "Sen-Regular", size: 16)
        passwordLable.font = UIFont(name: "Sen-Regular", size: 16)
        confirmPasswordLable.font = UIFont(name: "Sen-Regular", size: 16)
        
        usernameLable.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordLable.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordLable.translatesAutoresizingMaskIntoConstraints = false
        
        passwordField.isSecureTextEntry = true
        confirmPasswordField.isSecureTextEntry = true
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
        gradientLayer.cornerRadius = 20
        gradientLayer.masksToBounds = true  
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func makeLable(lableTexr: String) -> UILabel {
        let lable = UILabel()
        lable.text = lableTexr
        lable.textColor = .white
        return lable
    }
    
    private func makeField(placeholder: String) -> UITextField {
        let field = UITextField()
        field.heightAnchor.constraint(equalToConstant: 42).isActive = true
        field.backgroundColor = .white
        field.placeholder = placeholder
        field.borderStyle = .roundedRect
        field.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        )
        return field
    }
    
    private func setupButtonAction() {
        loginButton.addAction(UIAction { [weak self] _ in
            self?.loginButtonTapped()
        }, for: .touchUpInside)
    }
    
    private func loginButtonTapped() {
        viewModel.username = usernameField.text ?? ""
        viewModel.password = passwordField.text ?? ""
        viewModel.confirmPassword = confirmPasswordField.text ?? ""
        viewModel.loginButtonTapped()
    }
    
    private func setupBindings() {
        
        viewModel.loginAction = { [weak self] in
            
            let vc = QuizVC()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        //gamoaq erori
        viewModel.showEmptyAlert = {
            let alert = UIAlertController(title: "Error", message: "Username, password or Confirm password cannot be empty.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        viewModel.showMacdAlert = {
            let alert = UIAlertController(title: "Error", message: "Passwords do not match.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
