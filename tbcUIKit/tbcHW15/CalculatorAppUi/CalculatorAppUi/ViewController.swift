//
//  ViewController.swift
//  CalculatorAppUi
//
//  Created by Apple on 23.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    private var isDarkMode: Bool = false
    
    private let resultView = UIView()
    private let keyboardView = UIView()
    
    private var numberConting = UILabel()
    private var numberCounted = UILabel()
    
    private var numberContingLable = ""
    
    var historyPageResult = "\n"
    
    private lazy var resultStakView: UIStackView = createStackView(alignment: .trailing)
    private lazy var keyboardStakView : UIStackView = createStackView(axis: .horizontal)
    
    private lazy var firstVerticalStakViewInKeyboardViewe: UIStackView = createStackView()
    private lazy var secondVerticalStakViewInKeyboardViewe: UIStackView = createStackView()
    private lazy var thirdVerticalStakViewInKeyboardViewe: UIStackView = createStackView()
    private lazy var fourthVerticalStakViewInKeyboardViewe: UIStackView = createStackView()
    
    lazy private var button0 = createButton(title: "0")
    lazy private var button1 = createButton(title: "1")
    lazy private var button2 = createButton(title: "2")
    lazy private var button3 = createButton(title: "3")
    lazy private var button4 = createButton(title: "4")
    lazy private var button5 = createButton(title: "5")
    lazy private var button6 = createButton(title: "6")
    lazy private var button7 = createButton(title: "7")
    lazy private var button8 = createButton(title: "8")
    lazy private var button9 = createButton(title: "9")
    lazy private var buttonAC = createButton(title: "AC")
    lazy private var buttonPoint = createButton(title: ".")
    lazy private var buttonEcuals = createButton(title: "=")
    
    
    lazy private var buttonSunOrMoon = createButton(image: UIImage(named: "moonSvg"))
    lazy private var buttonPercent = createButton(image: UIImage(named: "percentSvg"))
    lazy private var buttonDivide = createButton(image: UIImage(named: "divideSvg"))
    lazy private var buttonMultiple = createButton(image: UIImage(named: "multipleSvg"))
    lazy private var buttonIncrement = createButton(image: UIImage(named: "increment"))
    lazy private var buttonDecrement = createButton(image: UIImage(named: "decrement"))
    
    private let historyButton = UIButton(type: .system) //new
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        lightMode()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        addGradientToButton(buttonEcuals)
        addCornerRadiusToButtons(for: [ buttonPercent, buttonDivide, buttonMultiple, buttonIncrement, buttonDecrement, buttonSunOrMoon])
        buttonEcuals.layer.cornerRadius = buttonPercent.frame.height / 2
    }
    
    private func setupUI() {
        setupResultView()
        setupKeyboardView()
        configurekeyboard()
        activeUiButton()
        activebuttonSunOrMoon()
    }
    
    private func setupResultView() {
        view.addSubview(resultView)
        resultView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        setResultStackViewConstraints()
        configureHistoryButton()
    }
    
    private func configureHistoryButton() {   
        resultView.addSubview(historyButton)
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(systemName: "clock.arrow.circlepath")
        historyButton.setImage(image, for: .normal)
        historyButton.tintColor = .black
        
        NSLayoutConstraint.activate([
            historyButton.topAnchor.constraint(equalTo: resultView.topAnchor, constant: 10),
            historyButton.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 10)
        ])
        
        historyButton.addAction(UIAction(handler: { [weak self] action in
            self?.historyButtonAction ()
        }), for: .touchUpInside)
    }
    
    private func historyButtonAction() {  //დავამატე ქმედების ღილაკი
        let vc = HistoryVc()
        vc.updateHistory(with: historyPageResult)
        vc.isDarkMode = self.isDarkMode
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createStackView(axis: NSLayoutConstraint.Axis = .vertical, alignment: UIStackView.Alignment = .fill) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        return stackView
    }
    
    private func setResultStackViewConstraints() {
        configureResulrTitleLable()
        
        resultView.addSubview(resultStakView)
        resultStakView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultStakView.rightAnchor.constraint(equalTo: resultView.rightAnchor, constant: -30),
            resultStakView.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -50)
        ])
    }
    
    private func configureResulrTitleLable() {
        numberConting.translatesAutoresizingMaskIntoConstraints = false
        resultStakView.addArrangedSubview(numberConting)
        numberConting.font = UIFont.boldSystemFont(ofSize: 16)
        numberConting.numberOfLines = 0
        numberConting.adjustsFontSizeToFitWidth = true
        
        numberCounted.translatesAutoresizingMaskIntoConstraints = false
        resultStakView.addArrangedSubview(numberCounted)
        numberCounted.font = UIFont.boldSystemFont(ofSize: 36)
        numberCounted.numberOfLines = 0
        numberCounted.adjustsFontSizeToFitWidth = true
    }
    
    private func setupKeyboardView() {
        
        view.addSubview(keyboardView)
        keyboardView.backgroundColor = .systemGray4
        keyboardView.layer.cornerRadius = 25
        keyboardView.clipsToBounds = true
        
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            keyboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            keyboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardView.topAnchor.constraint(equalTo: resultView.bottomAnchor),
            keyboardView.heightAnchor.constraint(equalTo: resultView.heightAnchor, multiplier: 1.5)
        ])
        keyboardStakViewConstraints()
    }
    
    private func keyboardStakViewConstraints() {
        keyboardView.addSubview(keyboardStakView)
        keyboardStakView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            keyboardStakView.topAnchor.constraint(equalTo: keyboardView.topAnchor, constant: 50),
            keyboardStakView.bottomAnchor.constraint(equalTo: keyboardView.bottomAnchor, constant: -20),
            keyboardStakView.leftAnchor.constraint(equalTo: keyboardView.leftAnchor, constant: 35),
            keyboardStakView.rightAnchor.constraint(equalTo: keyboardView.rightAnchor, constant: -35)
        ])
        buttonsBackgroundColorInLightmode()
    }
    
    private func createButton(title: String? = nil , image: UIImage? = nil) -> UIButton {
        let button = UIButton(type: .system)
        if let title = title {
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        }
        if let image = image {
            button.setImage(image, for: .normal)
        }
        button.clipsToBounds = true
        return button
    }
    
    private func configurekeyboard() {
        addVerticalStakViewInKeyboardStakView()
        addButtonInKeyboardVerticalStackView()
    }
    
    private func addVerticalStakViewInKeyboardStakView() {
        let stackViews = [firstVerticalStakViewInKeyboardViewe,
                          secondVerticalStakViewInKeyboardViewe,
                          thirdVerticalStakViewInKeyboardViewe,
                          fourthVerticalStakViewInKeyboardViewe]
        
        stackViews.forEach { stackView in
            stackView.translatesAutoresizingMaskIntoConstraints = false
            keyboardStakView.addArrangedSubview(stackView)
        }
    }
    
    private func addButtonInStackView(_ stackView: UIStackView, with buttons: [UIButton]) {
        buttons.forEach { button in
            stackView.addArrangedSubview(button)
        }
    }
    
    private func addButtonInKeyboardVerticalStackView() {
        addButtonInStackView(firstVerticalStakViewInKeyboardViewe, with: [buttonSunOrMoon, button7, button4, button1, buttonAC])
        addButtonInStackView(secondVerticalStakViewInKeyboardViewe, with: [buttonPercent, button8, button5, button2, button0])
        addButtonInStackView(thirdVerticalStakViewInKeyboardViewe, with: [buttonDivide, button9, button6, button3, buttonPoint])
        addButtonInStackView(fourthVerticalStakViewInKeyboardViewe, with: [buttonMultiple, buttonDecrement, buttonIncrement, buttonEcuals])
        
        equalButtonConstraints()
    }
    
    private func equalButtonConstraints() {
        NSLayoutConstraint.activate([
            buttonMultiple.heightAnchor.constraint(equalTo: buttonEcuals.heightAnchor, multiplier: 0.46),
            buttonDecrement.heightAnchor.constraint(equalTo: buttonMultiple.heightAnchor),
            buttonIncrement.heightAnchor.constraint(equalTo: buttonMultiple.heightAnchor),
            buttonEcuals.heightAnchor.constraint(equalTo: fourthVerticalStakViewInKeyboardViewe.heightAnchor, multiplier: 0.377)
        ])
    }
    
    private func addCornerRadiusToButtons(for buttons: [UIButton]) {
        buttons.forEach { $0.layer.cornerRadius = $0.frame.height / 2 }
    }
    
    private func activebuttonSunOrMoon() {
        let action = UIAction(title: "Switch Mode") { [weak self] _ in
            guard let self = self else { return }
            if self.isDarkMode {
                self.lightMode()
            } else {
                self.darkMode()
            }
            self.isDarkMode.toggle()
        }
        buttonSunOrMoon.addAction(action, for: .touchUpInside)
        buttonSunOrMoon.layer.borderColor = UIColor.lightGray.cgColor
        buttonSunOrMoon.layer.borderWidth = 2.0
        buttonSunOrMoon.backgroundColor = .clear
        buttonSunOrMoon.clipsToBounds = true
    }
    
    private func activeUiButton() { // აი ესარი სიამაყე
        
        let buttonActions: [(UIButton, String)] = [
            (button0, "0"), (button1, "1"), (button2, "2"),
            (button3, "3"), (button4, "4"), (button5, "5"),
            (button6, "6"), (button7, "7"), (button8, "8"),
            (button9, "9"), (buttonPoint, "."), (buttonAC, "AC"),
            (buttonPercent, "%"), (buttonDivide, "/"), (buttonMultiple, "*"),
            (buttonIncrement, "+"), (buttonDecrement, "-")
        ]
        
        // ჩვეულებრივი ღილაკების აქტივაცია და ბეჭდვის ფუნქციაზე გადასვლა
        buttonActions.forEach { button, value in
            button.addAction(UIAction { [weak self] _ in
                self?.buttonPress(value)
            }, for: .touchUpInside)
        }
        
        // ტოლობის ღილაკზე აქტივაციის დამატება და შედეგის გამოტვლა
        buttonEcuals.addAction(UIAction { [weak self] _ in
            self?.calculateResult()
        }, for: .touchUpInside)
    }
    
    // როცა ზოგადად ღილაკებს ვაჭერთ mag dros rac xdeba
    private func buttonPress(_ value: String) {
        if value == "AC" {
            numberContingLable = ""
            numberConting.text = ""
            historyPageResult += "AC" + "\n"
        }
        else if value == "%"{
            if let integer = Int(numberContingLable) {
                historyPageResult += "\(numberContingLable) % 100 = \(integer / 100)" + "\n"
                numberCounted.text = "\(Double(integer) / 100.0)"
                numberContingLable = "\(Double(integer) / 100.0)"
                numberConting.text = "\(numberContingLable) % "
            } else if let integer = Double(numberCounted.text ?? "10") {
                historyPageResult += "\(numberContingLable) % 100 = \(integer / 100)" + "\n"
                numberCounted.text = "\(Double(integer) / 100.0)"
                numberContingLable = "\(Double(integer) / 100.0)"
                numberConting.text = "\(numberContingLable) % "
            } else {
                return
            }
            
        } else {
            numberContingLable.append(value)
            numberConting.text = numberContingLable
        }
    }
    
    private func calculateResult() {
        let expression = NSExpression(format: numberContingLable)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            numberCounted.text = String(result)
            historyPageResult = "\(numberContingLable) = \(result)" + "\n" + "\(historyPageResult)"
            numberContingLable = "\(result)"
        }
        numberContingLable = ""
    }
    
    private func darkMode() {
        view.backgroundColor = .black
        keyboardStakView.tintColor = .white
        keyboardView.backgroundColor = UIColor(hex: "#27292E")
        view.backgroundColor = UIColor(hex: "#1E1E1E")
        numberConting.textColor = .white
        numberCounted.textColor = .white
        buttonSunOrMoon.setImage(UIImage(named: "sunIcon"), for: .normal)
        historyButton.tintColor = .white //new
        buttonsBackgroundColorInDarkmode()
    }
    
    private func lightMode() {
        view.backgroundColor = .white
        buttonEcuals.tintColor = .white
        keyboardStakView.tintColor = .black
        keyboardView.backgroundColor = .systemGray4
        numberConting.textColor = .systemGray
        numberCounted.textColor = .black
        buttonSunOrMoon.setImage(UIImage(named: "moonSvg"), for: .normal)
        historyButton.tintColor = .black //new
        buttonsBackgroundColorInLightmode()
    }
    
    private func buttonsBackgroundColorInDarkmode() {
        let buttons = [buttonDivide,
                       buttonPercent,
                       buttonDecrement,
                       buttonIncrement,
                       buttonMultiple ]
        
        buttons.forEach { button in
            button.backgroundColor = .systemGray
        }
    }
    
    private func buttonsBackgroundColorInLightmode() {
        let buttons = [buttonDivide,
                       buttonPercent,
                       buttonDecrement,
                       buttonIncrement,
                       buttonMultiple ]
        
        buttons.forEach { button in
            button.backgroundColor = .systemGray3
        }
    }
    
    func addGradientToButton(_ button: UIButton) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 237/255, green: 14/255, blue: 152/255, alpha: 1.0).cgColor, UIColor(red: 254/255, green: 90/255, blue: 45/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = button.bounds
        gradientLayer.cornerRadius = button.layer.cornerRadius
        button.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }

}



//#Preview {
//    ViewController()
//}

