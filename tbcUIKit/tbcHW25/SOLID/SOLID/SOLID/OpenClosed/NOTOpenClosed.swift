//
//  NOTOpenClosed.swift
//  SOLID
//
//  Created by Apple on 13.11.24.
//

import Foundation

/*
 კოდი ხედ რო წარმოვიდგინოთ მას ბევრი განშტოება არ უნდა ქონდეს (არვიცი გასაგებად ვამბობ თუ არა , სწორ კოდში უფრო უკეთ ავხსნი)
 */


//აქ იდეაში ნებისმიერი ტივისთვის ვითვლით გასდაკლებას


class DiscountCalculator {
    func calculateDiscount(for userType: String, amount: Double) -> Double {
        switch userType {
        case "Regular":
            return amount * 0.2
        case "Premium":
            return amount * 0.5
        default:
            return 0.0
        }
    }
}

//ყველი ახალი ტიპის შემოტანის დროს ფათური მოგვიწევს არსებულ კოდში 
