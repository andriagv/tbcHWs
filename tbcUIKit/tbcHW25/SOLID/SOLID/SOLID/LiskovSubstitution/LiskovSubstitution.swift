//
//  LiskovSubstitution.swift
//  SOLID
//
//  Created by Apple on 13.11.24.
//

import Foundation


/*
 თუ კლასი არის სხვა კლასის ქვეკლასი, მას უნდა შეეძლოს მშობელი კლასის ჩანაცვლება გაუთვალისწინებელი ქცევის გამოწვევის გარეშე.
 */


class Rectangle {
    var width: Double
    var height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func area() -> Double {
        return width * height
    }
}

class Square: Rectangle {
    init(side: Double) {
        super.init(width: side, height: side)
    }
}

//ამ გზით, Square ყოველთვის ყველა გვერდი ტოლიაქ ანუ კვადრატის ფორმის იქნება და არ დაარღვევს Rectangle-ის ქცევას.
//უფრო რო ჩავშალო Square-ე Rectangle-ს  მხოლოდ ერთ ცვლადს იყენებს, სიგძე სიგანე ტოლიროიყოს.
//და თვითონ Rectangle კი ორი პარამეტრიაქ სიგრძე სიმაღლე , მართკუთხედის ფორმისა


// ანუ ჩვენ ამგვარად შეგვიძლია ფართობის გამოთვლა 
func printArea(of rectangle: Rectangle) {
    print("Area: \(rectangle.area())")
}

printArea(of: Rectangle(width: 5, height: 10))
printArea(of: Square(side: 5))
