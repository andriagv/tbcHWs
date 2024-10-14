//
//  SurveyButton.swift
//  CalculatorAppUI
//
//  Created by Apple on 13.10.24.
//

import UIKit

class SurveyButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .red
        titleLabel?.font = UIFont(name: "ki", size: 28)
        layer.cornerRadius = 10
    }

}
#Preview {
    SurveyButton()
}
