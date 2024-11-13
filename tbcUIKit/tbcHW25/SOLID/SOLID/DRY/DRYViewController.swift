//
//  DRYViewController.swift
//  SOLID
//
//  Created by Nika Topuria on 12.11.24.
//

import UIKit

final class DRYViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         მართკუთხედის ფართობის გამოსათვლელი ლოგიკა გატანილია მეთოდში, რაც
         აქრობს ფართობის გამოთვლის კოდის გამეორების საჭიროებას.
         */
        
        // Function to calculate area
        func calculateArea(length: Double, width: Double) -> Double {
            length * width
        }
        
        // First rectangle
        let area1 = calculateArea(length: 5.0, width: 10.0)
        print("The area of the first rectangle is \(area1)")
        
        // Second rectangle
        let area2 = calculateArea(length: 7.0, width: 3.0)
        print("The area of the second rectangle is \(area2)")
        
        // Third rectangle
        let area3 = calculateArea(length: 2.0, width: 9.0)
        print("The area of the third rectangle is \(area3)")
    }
}
