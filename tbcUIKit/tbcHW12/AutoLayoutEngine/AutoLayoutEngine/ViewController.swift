//
//  ViewController.swift
//  AutoLayoutEngine
//
//  Created by Apple on 09.10.24.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var xButton: UIButton!
    
    @IBOutlet weak var walpaper: UIView?
    
    @IBOutlet weak var moonOrSun: UIButton?
    @IBOutlet weak var procButton: UIButton?
    @IBOutlet weak var divButton: UIButton?
    @IBOutlet weak var mainusButon: UIButton?
    @IBOutlet weak var plusBurron: UIButton?
    @IBOutlet weak var a: UIButton?
    @IBOutlet weak var a0: UIButton?
    @IBOutlet weak var a1: UIButton?
    @IBOutlet weak var a2: UIButton?
    @IBOutlet weak var a3: UIButton?
    @IBOutlet weak var a4: UIButton?
    @IBOutlet weak var a5: UIButton?
    @IBOutlet weak var a6: UIButton?
    @IBOutlet weak var a7: UIButton?
    @IBOutlet weak var a8: UIButton?
    @IBOutlet weak var a9: UIButton?
    @IBOutlet weak var label2: UILabel?
    @IBOutlet weak var label1: UILabel?
    
    var x = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moonOrSun?.tintColor = .tertiaryLabel
        plusBurron?.tintColor = .tertiaryLabel
        divButton?.tintColor = .tertiaryLabel
        procButton?.tintColor = .tertiaryLabel
        xButton?.tintColor = .tertiaryLabel
        
        mainusButon?.tintColor = .tertiaryLabel
        walpaper?.backgroundColor = UIColor(hex: "#F5F5F7")
    }
    
    
    @IBAction private func darkMode(_ sender: UIButton) {
        if x == 5 {
            view.backgroundColor = UIColor(named: "#161616")
            walpaper?.backgroundColor = UIColor(named: "#FFFFFF")
            a?.tintColor = .white
            a0?.tintColor = .white
            a1?.tintColor = .white
            a2?.tintColor = .white
            a3?.tintColor = .white
            a4?.tintColor = .white
            a5?.tintColor = .white
            a6?.tintColor = .white
            a7?.tintColor = .white
            a8?.tintColor = .white
            a9?.tintColor = .white
            label1?.textColor = .white
            label2?.textColor = .white
            x = 4
            
        } else {
            view.backgroundColor = .white
            walpaper?.backgroundColor = UIColor(hex: "#F5F5F7")
            a?.tintColor = .black
            a0?.tintColor = .black
            a1?.tintColor = .black
            a2?.tintColor = .black
            a3?.tintColor = .black
            a4?.tintColor = .black
            a5?.tintColor = .black
            a6?.tintColor = .black
            a7?.tintColor = .black
            a8?.tintColor = .black
            a9?.tintColor = .black
            label1?.textColor = .black
            label2?.textColor = .black
            x = 5
        }
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

