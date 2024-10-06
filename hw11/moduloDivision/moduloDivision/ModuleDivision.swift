import UIKit

final class ModuleDivision: UIViewController {
    @IBOutlet weak var BackgroundColor: UILabel?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var textField1: UITextField?
    @IBOutlet weak var textField2: UITextField?
    @IBOutlet weak var resultLabel: UILabel?
    @IBOutlet weak var switchCounter: UISwitch!
    
    var result: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        BackgroundColor?.textColor = .white
        titleLabel?.textColor = .white
        resultLabel?.textColor = .white
    }
    
    @IBAction func backgroundColorSwicher(_ sender: UISwitch) {
        if sender.isOn {
            titleLabel?.textColor = .white
            resultLabel?.textColor = .white
            BackgroundColor?.textColor = .white
            view.backgroundColor = .black
        } else {
            titleLabel?.textColor = .black
            resultLabel?.textColor = .black
            BackgroundColor?.textColor = .black
            view.backgroundColor = .white
        }
    }
    
    @IBAction func changeTitleLabel(_ sender: UISwitch) {
        if sender.isOn {
            titleLabel?.text = "ნაშთიანი გაყოფა"
        } else {
            titleLabel?.text = "უნაშთო გაყოფია"
        }
    }
    
    @IBAction func counterButton(_ sender: UIButton) {
        if isZero() {
            resultLabel?.text = "ნულზე გაყოფა არ შეიძლება"
        } else {
            chooseCounterType()
            resultLabel?.text = "პასუხი: \(result)"
        }
    }
    
    private func isZero() -> Bool {
        convertToInt(textField2) == 0
    }
    
    private func chooseCounterType() {
        if switchCounter.isOn {
            performRemainderDivision()
        } else {
            performNonRemainderDivision()
        }
    }
    
    private func convertToInt(_ textField: UITextField?) -> Int? {
        if let text = textField?.text, let number = Int(text) {
            return number
        }
        return nil
    }
    
    private func performRemainderDivision()  {
        if let number1 = convertToInt(textField1), let number2 = convertToInt(textField2) {
            result = "\(number1 % number2)"
        }
    }
    
    private func performNonRemainderDivision() {
        if let number1 = convertToInt(textField1), let number2 = convertToInt(textField2) {
            result = "\(Double(number1 / number2))"
        }
    }
}
