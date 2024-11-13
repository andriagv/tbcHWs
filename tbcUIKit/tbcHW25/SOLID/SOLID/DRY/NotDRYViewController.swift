//
//  NotDRYViewController.swift
//  SOLID
//
//  Created by Nika Topuria on 12.11.24.
//

import UIKit

final class NotDRYViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         თითოეული მართკუთხედისთვის ინდივიდუალურად ხდება ფართობის
         გამოსათვლელი გამოსახულების დაწერა, რაც ეწინააღმდეგება DRY პრინციპს
         */
        
        // First rectangle
        let length1 = 5.0
        let width1 = 10.0
        let area1 = length1 * width1
        print("The area of the first rectangle is \(area1)")
        
        // Second rectangle
        let length2 = 7.0
        let width2 = 3.0
        let area2 = length2 * width2
        print("The area of the second rectangle is \(area2)")
        
        // Third rectangle
        let length3 = 2.0
        let width3 = 9.0
        let area3 = length3 * width3
        print("The area of the third rectangle is \(area3)")
    }
}
