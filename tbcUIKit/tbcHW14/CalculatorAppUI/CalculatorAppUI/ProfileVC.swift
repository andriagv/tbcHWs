import UIKit



final class ProfileVC: UIViewController {
    

    let resultView = UIView()
    let buttomViewe = UIView()
    
    var numberConting =  UILabel()
    var numberCounted = UILabel()


   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupUI()

    }
    
    private func setupUI() {
        setupResultView()
        setupButtomViewe()
//        configuretitleLable()
        
    }
    
    private func setupResultView() {
        resultView.frame = CGRect(x: 0, y: 0, width: 393, height: 303.67)
        view.addSubview(resultView)
        resultView.backgroundColor = .red
        resultView.translatesAutoresizingMaskIntoConstraints = false
       
        resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        resultView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        

    }
    
    private func setupButtomViewe() {
        buttomViewe.frame = CGRect(x: 0, y: 362.67, width: 393, height: 455.33)
        view.addSubview(buttomViewe)
        buttomViewe.backgroundColor = .green
        buttomViewe.translatesAutoresizingMaskIntoConstraints = false
        
        buttomViewe.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        buttomViewe.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        buttomViewe.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        buttomViewe.topAnchor.constraint(equalTo: resultView.bottomAnchor).isActive = true
        buttomViewe.heightAnchor.constraint(equalTo: resultView.heightAnchor, multiplier: 1.5).isActive = true
    }
    
    
    func configuretitleLable() {
        view.addSubview(numberConting)
        numberConting.text = "ok"
        numberConting.font = UIFont.boldSystemFont(ofSize: 36)
        //numberConting.textAlignment = .center
        numberConting.numberOfLines = 0
        numberConting.adjustsFontSizeToFitWidth = true
        setNumberContingConstraints()
        
        view.addSubview(numberCounted)
        numberCounted.text = "isw"
        numberCounted.font = UIFont.boldSystemFont(ofSize: 36)
        //numberCounted.textAlignment = .center
        numberCounted.numberOfLines = 0
        numberCounted.adjustsFontSizeToFitWidth = true
        setNumberCountedConstraints()
    }
    
    func setNumberContingConstraints() {
        numberConting.translatesAutoresizingMaskIntoConstraints = false
        numberConting.topAnchor.constraint(equalTo: resultView.topAnchor, constant: 20).isActive = true
        numberConting.trailingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 20).isActive = true
        numberConting.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -20).isActive = true
    }
    
    func setNumberCountedConstraints() {
        numberCounted.translatesAutoresizingMaskIntoConstraints = false
        numberCounted.topAnchor.constraint(equalTo: numberConting.topAnchor, constant: 50).isActive = true
        numberCounted.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 20).isActive = true
        numberCounted.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -20).isActive = true
        numberConting.bottomAnchor.constraint(equalTo: resultView.bottomAnchor).isActive = true
        
    }
}

#Preview {
    ProfileVC()
}
