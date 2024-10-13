import UIKit



final class ProfileVC: UIViewController {
    

    private let profileImageView = UIImageView()
    private let AndriasImageView = UIImageView()
    
    var nameLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    var ageLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupUI()
        

    }
    
    private func setupUI() {
        setupProfileImage()
        setupNameLabel()
        setupAgeLabel()
    }
    
    private func setupProfileImage() {

    }
    
    private func setupNameLabel() {
       
    }

    private func setupAgeLabel() {
        
    }
}

#Preview {
    ProfileVC()
}
