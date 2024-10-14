import UIKit



final class ViewController: UIViewController {
    
    private var x = 5
    
    private let resultView = UIView()
    private let keyboardView = UIView()
    
    private var numberConting = UILabel()
    private var numberCounted = UILabel()
    
    private var resultStakView = UIStackView()
    private var keyboardStakView = UIStackView()
    
    private var firstVerticalStakViewInKeyboardViewe = UIStackView()
    private var secondVerticalStakViewInKeyboardViewe = UIStackView()
    private var thirdVerticalStakViewInKeyboardViewe = UIStackView()
    private var fourthVerticalStakViewInKeyboardViewe = UIStackView()
    
    lazy private var button0: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("0", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy private var button1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("1", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy private var button2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("2", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy private var button3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("3", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy private var button4: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("4", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy private var button5: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("5", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy private var button6: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("6", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy private var button7: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("7", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy private var button8: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("8", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy private var button9: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("9", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy private var buttonAC: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("AC", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy private var buttonSun: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "moonSvg")
        button.setImage(image, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    lazy private var buttonPercent: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "percentLight")
        button.setImage(image, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    lazy private var buttonDivide: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "divideLight")
        button.setImage(image, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    lazy private var buttonMultiple: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "multipleLight")
        button.setImage(image, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    lazy private var buttonIncrement: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "incrementLight")
        button.setImage(image, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    lazy private var buttonDecrement: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "decrementLight")
        button.setImage(image, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    lazy private var buttonEcuals: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("=", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        button.tintColor = .none
        button.clipsToBounds = true
        return button
    }()
    lazy private var buttonPoint: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(".", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        lightMode()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        addGradientToButton(buttonEcuals)
        buttonSun.layer.cornerRadius = buttonMultiple.frame.height / 2
        buttonPercent.layer.cornerRadius = buttonMultiple.frame.height / 2
        buttonDivide.layer.cornerRadius = buttonMultiple.frame.height / 2
        buttonMultiple.layer.cornerRadius = buttonMultiple.frame.height / 2
        buttonIncrement.layer.cornerRadius = buttonMultiple.frame.height / 2
        buttonDecrement.layer.cornerRadius = buttonMultiple.frame.height / 2
        buttonEcuals.layer.cornerRadius = buttonMultiple.frame.height / 2
    }
    
    private func setupUI() {
        setupResultView()
        setupKeyboardView()
        setipVerticalViewsInHorizontalViev()
        activeUiButton()
    }
    
    private func configureResultView() {
        view.addSubview(resultView)
        let posicionOfResultView = CGPoint(x: 0, y: 0)
        let sizeOfResultView = CGSize(width: 100, height: 100)
        resultView.frame = CGRect(origin: posicionOfResultView, size: sizeOfResultView)
    }
    
    private func setupResultView() {
        configureResultView()
        
        resultView.translatesAutoresizingMaskIntoConstraints = false
        resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        resultView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        configureResultStackView()
    }
    
    private func configureResultStackView() {
        resultView.addSubview(resultStakView)
        resultStakView.axis = .vertical
        resultStakView.alignment = .trailing
        resultStakView.distribution = .fill
        resultStakView.spacing = 15
        configureResulrTitleLable()
        setResultStackViewConstraints()
    }
    
    private func setResultStackViewConstraints() {
        resultStakView.translatesAutoresizingMaskIntoConstraints = false
        resultStakView.rightAnchor.constraint(equalTo: resultView.rightAnchor, constant: -30).isActive = true
        resultStakView.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -50).isActive = true
    }
    
    private func configureResulrTitleLable() {
        numberConting.translatesAutoresizingMaskIntoConstraints = false
        resultStakView.addArrangedSubview(numberConting)
        numberConting.text = "120 x 3 + 608 + 1080"
        numberConting.font = UIFont.boldSystemFont(ofSize: 16)
        numberConting.numberOfLines = 0
        numberConting.adjustsFontSizeToFitWidth = true
        
        numberCounted.translatesAutoresizingMaskIntoConstraints = false
        resultStakView.addArrangedSubview(numberCounted)
        numberCounted.text = "2,048"
        numberCounted.font = UIFont.boldSystemFont(ofSize: 36)
        numberCounted.numberOfLines = 0
        numberCounted.adjustsFontSizeToFitWidth = true
    }
    
    private func configureKeyboardViewe() {
        let posicionOfKeyboardViewe = CGPoint(x: 0, y: 362.67)
        let sizeOfKeyboardViewe = CGSize(width: 393, height: 455.33)
        resultView.frame = CGRect(origin: posicionOfKeyboardViewe, size: sizeOfKeyboardViewe)
        view.addSubview(keyboardView)
        keyboardView.backgroundColor = .systemGray4
        keyboardView.layer.cornerRadius = 25
        keyboardView.clipsToBounds = true
    }
    
    private func setupKeyboardView() {
        configureKeyboardViewe()
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        keyboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        keyboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        keyboardView.topAnchor.constraint(equalTo: resultView.bottomAnchor).isActive = true
        keyboardView.heightAnchor.constraint(equalTo: resultView.heightAnchor, multiplier: 1.5).isActive = true
        configureKeyboardStakView()
    }
    
    private func configureKeyboardStakView() {
        keyboardStakView.translatesAutoresizingMaskIntoConstraints = false
        keyboardView.addSubview(keyboardStakView)
        keyboardStakView.axis = .horizontal
        keyboardStakView.alignment = .fill
        keyboardStakView.distribution = .fillEqually
        keyboardStakView.spacing = 15
        keyboardStakViewConstraints()
        buttonsBackgroundColorInLightmode()
    }
    
    private func keyboardStakViewConstraints() {
        keyboardStakView.translatesAutoresizingMaskIntoConstraints = false
        keyboardStakView.topAnchor.constraint(equalTo: keyboardView.topAnchor, constant: 50).isActive = true
        keyboardStakView.bottomAnchor.constraint(equalTo: keyboardView.bottomAnchor, constant: -20).isActive = true
        keyboardStakView.leftAnchor.constraint(equalTo: keyboardView.leftAnchor, constant: 35).isActive = true
        keyboardStakView.rightAnchor.constraint(equalTo: keyboardView.rightAnchor, constant: -35).isActive = true
    }
    
    private func setipVerticalViewsInHorizontalViev() {
        configureAllVerticalStakView()
        setupFirstVerticalStakViewInKeyboardViewe()
        setupSecondVerticalStakViewInKeyboardViewe()
        setupThirdVerticalStakViewInKeyboardView()
        setupFourthVerticalStakViewInKeyboardViewe()
    }
    
    private func configureAllVerticalStakView() {
        firstVerticalStakViewInKeyboardViewe.translatesAutoresizingMaskIntoConstraints = false
        secondVerticalStakViewInKeyboardViewe.translatesAutoresizingMaskIntoConstraints = false
        thirdVerticalStakViewInKeyboardViewe.translatesAutoresizingMaskIntoConstraints = false
        fourthVerticalStakViewInKeyboardViewe.translatesAutoresizingMaskIntoConstraints = false
        
        keyboardStakView.addArrangedSubview(firstVerticalStakViewInKeyboardViewe)
        keyboardStakView.addArrangedSubview(secondVerticalStakViewInKeyboardViewe)
        keyboardStakView.addArrangedSubview(thirdVerticalStakViewInKeyboardViewe)
        keyboardStakView.addArrangedSubview(fourthVerticalStakViewInKeyboardViewe)
        
        firstVerticalStakViewInKeyboardViewe.axis = .vertical
        secondVerticalStakViewInKeyboardViewe.axis = .vertical
        thirdVerticalStakViewInKeyboardViewe.axis = .vertical
        fourthVerticalStakViewInKeyboardViewe.axis = .vertical
        
        firstVerticalStakViewInKeyboardViewe.alignment = .fill
        secondVerticalStakViewInKeyboardViewe.alignment = .fill
        thirdVerticalStakViewInKeyboardViewe.alignment = .fill
        fourthVerticalStakViewInKeyboardViewe.alignment = .fill
        
        firstVerticalStakViewInKeyboardViewe.distribution = .fillEqually
        secondVerticalStakViewInKeyboardViewe.distribution = .fillEqually
        thirdVerticalStakViewInKeyboardViewe.distribution = .fillEqually
        fourthVerticalStakViewInKeyboardViewe.distribution = .fillProportionally
        
        firstVerticalStakViewInKeyboardViewe.spacing = 15
        secondVerticalStakViewInKeyboardViewe.spacing = 15
        thirdVerticalStakViewInKeyboardViewe.spacing = 15
        fourthVerticalStakViewInKeyboardViewe.spacing = 15
    }
    
    private func setupFirstVerticalStakViewInKeyboardViewe() {
        firstVerticalStakViewInKeyboardViewe.addArrangedSubview(buttonSun)
        firstVerticalStakViewInKeyboardViewe.addArrangedSubview(button7)
        firstVerticalStakViewInKeyboardViewe.addArrangedSubview(button4)
        firstVerticalStakViewInKeyboardViewe.addArrangedSubview(button1)
        firstVerticalStakViewInKeyboardViewe.addArrangedSubview(buttonAC)
    }
    
    private func setupSecondVerticalStakViewInKeyboardViewe() {
        secondVerticalStakViewInKeyboardViewe.addArrangedSubview(buttonPercent)
        secondVerticalStakViewInKeyboardViewe.addArrangedSubview(button8)
        secondVerticalStakViewInKeyboardViewe.addArrangedSubview(button5)
        secondVerticalStakViewInKeyboardViewe.addArrangedSubview(button2)
        secondVerticalStakViewInKeyboardViewe.addArrangedSubview(button0)
    }
    
    private func setupThirdVerticalStakViewInKeyboardView() {
        thirdVerticalStakViewInKeyboardViewe.addArrangedSubview(buttonDivide)
        thirdVerticalStakViewInKeyboardViewe.addArrangedSubview(button9)
        thirdVerticalStakViewInKeyboardViewe.addArrangedSubview(button6)
        thirdVerticalStakViewInKeyboardViewe.addArrangedSubview(button3)
        thirdVerticalStakViewInKeyboardViewe.addArrangedSubview(buttonPoint)
    }
    
    private func setupFourthVerticalStakViewInKeyboardViewe() {
        fourthVerticalStakViewInKeyboardViewe.addArrangedSubview(buttonMultiple)
        fourthVerticalStakViewInKeyboardViewe.addArrangedSubview(buttonDecrement)
        fourthVerticalStakViewInKeyboardViewe.addArrangedSubview(buttonIncrement)
        fourthVerticalStakViewInKeyboardViewe.addArrangedSubview(buttonEcuals)
        equalButtonConstraints()
    }
    
    private func equalButtonConstraints() {
        let buttonHeightConstraint = buttonMultiple.heightAnchor.constraint(equalTo: buttonEcuals.heightAnchor, multiplier: 0.46)
        buttonHeightConstraint.isActive = true
        buttonDecrement.heightAnchor.constraint(equalTo: buttonMultiple.heightAnchor).isActive = true
        buttonIncrement.heightAnchor.constraint(equalTo: buttonMultiple.heightAnchor).isActive = true
        buttonEcuals.heightAnchor.constraint(equalTo: fourthVerticalStakViewInKeyboardViewe.heightAnchor, multiplier: 0.377).isActive = true
    }
    
    private func activeUiButton() {
        let button = buttonSun
        let action = UIAction(title: "oka") { (action) in
            if self.x == 5 {
                self.darkMode()
                self.x = 4
            } else {
                self.lightMode()
                self.x = 5
            }
        }
        button.addAction(action, for: .touchUpInside)
    }
    
    private func darkMode() {
        view.backgroundColor = .black
        keyboardStakView.tintColor = .white
        keyboardView.backgroundColor = UIColor(hex: "#27292E")
        view.backgroundColor = UIColor(hex: "#1E1E1E")
        numberConting.textColor = .white
        numberCounted.textColor = .white
        buttonSun.setImage(UIImage(named: "sunIcon"), for: .normal)
        buttonsBackgroundColorInDarkmode()
    }
    
    private func lightMode() {
        view.backgroundColor = .white
        keyboardStakView.tintColor = .black
        keyboardView.backgroundColor = .systemGray4
        numberConting.textColor = .systemGray
        numberCounted.textColor = .black
        buttonSun.setImage(UIImage(named: "moonSvg"), for: .normal)
        buttonsBackgroundColorInLightmode()
    }
    
    private func buttonsBackgroundColorInDarkmode() {
        buttonDivide.backgroundColor = .systemGray
        buttonPercent.backgroundColor = .systemGray
        buttonSun.backgroundColor = .systemGray
        buttonDecrement.backgroundColor = .systemGray
        buttonIncrement.backgroundColor = .systemGray
        buttonMultiple.backgroundColor = .systemGray
    }
    
    private func buttonsBackgroundColorInLightmode() {
        buttonDivide.backgroundColor = .systemGray3
        buttonPercent.backgroundColor = .systemGray3
        buttonSun.backgroundColor = .systemGray3
        buttonDecrement.backgroundColor = .systemGray3
        buttonIncrement.backgroundColor = .systemGray3
        buttonMultiple.backgroundColor = .systemGray3
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


#Preview {
    ViewController()
}
