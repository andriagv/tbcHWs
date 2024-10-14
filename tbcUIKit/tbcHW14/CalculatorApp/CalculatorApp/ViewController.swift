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
    
    private let gradient = CAGradientLayer()
    
    lazy var button0: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("0", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy var button1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("1", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy var button2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("2", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy var button3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("3", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy var button4: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("4", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy var button5: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("5", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy var button6: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("6", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy var button7: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("7", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy var button8: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("8", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy var button9: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("9", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy var buttonAC: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("AC", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        return button
    }()
    lazy var buttonSun: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "moonSvg")
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 35
        button.clipsToBounds = true
        return button
    }()
    lazy var buttonPercent: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "percentLight")
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 35
        button.clipsToBounds = true
        return button
    }()
    lazy var buttonDivide: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "divideLight")
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 35
        button.clipsToBounds = true
        return button
    }()
    lazy var buttonMultiple: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "multipleLight")
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 35
        button.clipsToBounds = true
        return button
    }()
    lazy var buttonIncrement: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "incrementLight")
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 35
        button.clipsToBounds = true
        return button
    }()
    lazy var buttonDecrement: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "decrementLight")
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 35
        button.clipsToBounds = true
        return button
    }()
    lazy var buttonEcuals: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("7", for: .normal)
        let image = UIImage(named: "equals")
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 35
        button.clipsToBounds = true
        button.tintColor = .systemGray3
        return button
    }()
    lazy var buttonPoint: UIButton = {
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
    
    private func setupUI() {
        setupResultView()
        setupKeyboardView()
        setipVerticalViewsInHorizontalViev()
        activeUiButton()
        applyGradientToButtonEcuals()
    }
    
    //ზედა ნაწილი
    
    //ზედა ვიუს განლაგება
    private func configureResultView() {
        view.addSubview(resultView)
        let posicionOfResultView = CGPoint(x: 0, y: 0)
        let sizeOfResultView = CGSize(width: 100, height: 100)
        resultView.frame = CGRect(origin: posicionOfResultView, size: sizeOfResultView)
    }
    //ზედა ვიუ კონსტრეინტები
    private func setupResultView() {
        configureResultView()
        
        resultView.translatesAutoresizingMaskIntoConstraints = false
        resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        resultView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        configureResultStackView()
    }
    //ზედა რეზალტ ვიუში ჩამატებული სტეკ ვიუსი parametrebi
    private func configureResultStackView() {
        resultView.addSubview(resultStakView)
        resultStakView.axis = .vertical
        resultStakView.alignment = .trailing
        resultStakView.distribution = .fill
        resultStakView.spacing = 15
        configureResulrTitleLable()
        setResultStackViewConstraints()
    }
    //ზედა რეზალტ ვიუში ჩამატებული სტეკ ვიუს დამაგრება
    private func setResultStackViewConstraints() {
        resultStakView.translatesAutoresizingMaskIntoConstraints = false
        resultStakView.topAnchor.constraint(equalTo: resultView.topAnchor, constant: 100).isActive = true
        resultStakView.rightAnchor.constraint(equalTo: resultView.rightAnchor, constant: -30).isActive = true
    }
    // საანგარიშო რიცხვები სტეიკ ვიუში ჩამატება და ვიზუალიზაცია
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
    
    //ქვედა ნაწილი
    
    //ქვედა ვიუს განლაგება
    private func configureKeyboardViewe() {
        let posicionOfKeyboardViewe = CGPoint(x: 0, y: 362.67)
        let sizeOfKeyboardViewe = CGSize(width: 393, height: 455.33)
        resultView.frame = CGRect(origin: posicionOfKeyboardViewe, size: sizeOfKeyboardViewe)
        view.addSubview(keyboardView)
        keyboardView.backgroundColor = .systemGray4
    }
    //ქვედა ვიუს კონსტრეინტები
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
    //ქვედა  ვიუში ჩამატებული სტეკ ვიუსი parametrebi
    private func configureKeyboardStakView() {
        keyboardStakView.translatesAutoresizingMaskIntoConstraints = false
        keyboardView.addSubview(keyboardStakView)
        keyboardStakView.axis = .horizontal
        keyboardStakView.alignment = .fill
        keyboardStakView.distribution = .fillEqually
        keyboardStakView.spacing = 15
        keyboardStakView.tintColor = .black
        keyboardStakViewConstraints()
        buttonsBackgroundColorInLightmode()
    }
    //ქვედა  ვიუში ჩამატებული სტეკ ვიუს დამაგრება
    private func keyboardStakViewConstraints() {
        keyboardStakView.translatesAutoresizingMaskIntoConstraints = false
        keyboardStakView.topAnchor.constraint(equalTo: keyboardView.topAnchor, constant: 50).isActive = true
        keyboardStakView.bottomAnchor.constraint(equalTo: keyboardView.bottomAnchor, constant: -20).isActive = true
        keyboardStakView.leftAnchor.constraint(equalTo: keyboardView.leftAnchor, constant: 35).isActive = true
        keyboardStakView.rightAnchor.constraint(equalTo: keyboardView.rightAnchor, constant: -35).isActive = true
    }
    //gamoaxeba
    private func setipVerticalViewsInHorizontalViev() {
        configureAllVerticalStakView()
        setupFirstVerticalStakViewInKeyboardViewe()
        setupSecondVerticalStakViewInKeyboardViewe()
        setupThirdVerticalStakViewInKeyboardView()
        setupFourthVerticalStakViewInKeyboardViewe()
    }
    //konfiguacia
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
        fourthVerticalStakViewInKeyboardViewe.distribution = .fillEqually
        
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
    
    //bolo vertikalshi ganlageba gilakebis
    private func equalButtonConstraints() {
        let buttonHeightConstraint = buttonMultiple.heightAnchor.constraint(equalTo: buttonEcuals.heightAnchor, multiplier: 0.4)
        buttonHeightConstraint.isActive = true
        
        buttonDecrement.heightAnchor.constraint(equalTo: buttonMultiple.heightAnchor).isActive = true
        buttonIncrement.heightAnchor.constraint(equalTo: buttonMultiple.heightAnchor).isActive = true
        
        buttonEcuals.heightAnchor.constraint(equalTo: fourthVerticalStakViewInKeyboardViewe.heightAnchor, multiplier: 0.4).isActive = true
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
        buttonsBackgroundColorInDarkmode()
    }
    private func lightMode() {
        view.backgroundColor = .white
        keyboardStakView.tintColor = .black
        keyboardView.backgroundColor = .systemGray4
        numberConting.textColor = .black
        numberCounted.textColor = .black
        buttonsBackgroundColorInLightmode()
    }
    private func buttonsBackgroundColorInDarkmode() {
        buttonEcuals.backgroundColor = .systemGray
        buttonDivide.backgroundColor = .systemGray
        buttonPercent.backgroundColor = .systemGray
        buttonSun.backgroundColor = .systemGray
        buttonDecrement.backgroundColor = .systemGray
        buttonIncrement.backgroundColor = .systemGray
        buttonMultiple.backgroundColor = .systemGray
    }
    
    private func buttonsBackgroundColorInLightmode() {
        buttonEcuals.backgroundColor = .systemGray3
        buttonDivide.backgroundColor = .systemGray3
        buttonPercent.backgroundColor = .systemGray3
        buttonSun.backgroundColor = .systemGray3
        buttonDecrement.backgroundColor = .systemGray3
        buttonIncrement.backgroundColor = .systemGray3
        buttonMultiple.backgroundColor = .systemGray3
    }
    
    private func applyGradientToButtonEcuals() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(hex: "#ED0E98")!.cgColor, UIColor(hex: "#FE5A2D")!.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = buttonEcuals.bounds
        gradient.cornerRadius = buttonEcuals.layer.cornerRadius

        //buttonEcuals.layer.insertSublayer(gradient, at: 0)
        buttonEcuals.backgroundColor = .red
        
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
