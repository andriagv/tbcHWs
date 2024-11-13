//
//  OpenClosed.swift
//  SOLID
//
//  Created by Apple on 13.11.24.
//

import Foundation

//OCP გვეუბნება, რომ კლასი უნდა იყოს "ღია" გაფართოებისთვის, მაგრამ "დახურული" ცვლილებებისთვის. ანუ, არსებული ფუნქციების შეცვლის გარეშე შეგვეძლება ახალი ფუნქციების დამატება.

/*
 შეგვიძლია კონკრეტული ქმედების პროტოკოლი შევქმნათ და მერე მას დავუქვემდებაროტ სხვები , ეს აგვარიდებს ტავიდან if let და case ების წერას.
 
 აქ ფასდაკლების პროტოკოლს ვქმნიტ რომელიც ვიციტ რო მიიღებს საწყის ფას და დაგვიბრუნებს ფასდაკლებულს , და ამ ტვისებას მერე ჩვენთვის სასურველ ფუნქციებს მივანიჭებთ
 */



protocol Discountable {
    func calculateDiscount(for amount: Double) -> Double
}

class RegularDiscount: Discountable {
    func calculateDiscount(for amount: Double) -> Double {
        amount * 0.2
    }
}

class PremiumDiscount: Discountable {
    func calculateDiscount(for amount: Double) -> Double {
        amount * 0.5
    }
}


// აქ უკვე ზოგად კლას ვქმნით რომელიც უშუალოდ მიიღებს თავში აღწერილი პროტოკოლის მქონე ტიპებს

class DiscountCalc {
    func calculateDiscount(for discountType: Discountable, amount: Double) -> Double {
        discountType.calculateDiscount(for: amount)
    }
}

//აი ასე შეგვიძლია გამოძახება
let calculator = DiscountCalc()
let discount = calculator.calculateDiscount(for: PremiumDiscount(), amount: 10)


// ამის მორალი არი ის რო ჩვენ თუ ახალი საწვავი შემოგვივა მაგისთვის ცაკლე ფუნქციის დაწერა შეგვეძლება და არა უკვე არსებულ კოდში რაღაც ახალის ჩაკვეხნა
//რამდენიც გვინდა იმდენი საწვავი შემოვიღოთ და შევქმნატ ახალი კლასი , ოღონდ ჩვენ ფასდაკლებადობის პროტოკოლი მივაღებინოთ



//ერტი სიტყვით გაფართოვება მოდიფიკაციის გარეშე


//MARK: - მერე ვარიანთი

class DiscountCalcul {
    private let discount: Discountable
        
        init(discountStrategy: Discountable) {
            self.discount = discountStrategy
        }
        
        func calculateDiscount(for price: Double) -> Double {
            return discount.calculateDiscount(for: price)
        }
}

let price = DiscountCalcul(discountStrategy: RegularDiscount()).calculateDiscount(for: 10)
