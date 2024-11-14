//
//  NOTInterfaceSegregation.swift
//  SOLID
//
//  Created by Apple on 13.11.24.
//

import Foundation


//არარი აუცილებელი რო სასწაულად მონსტრი ქცევბი გვქონდეს როგორც ვასო იტყოდა

//მაგალიტად მოვიყვან ტიპს რომელიც ან წამს ამ მუშაობს
//და რობორს რომელიც ანალოგიურად იქცევა რა


//ამის არსისწორე იმაში მდგომარეობს რომ Worker ს ახალი შესაძლებლობა რო დაემატოს რობოტს და ადამიანს ცალცაკლე უნდა ჩავუმატოტ ეგ შესაძლებლობა
//მაგრამ თუ თუ ვიტრაიჰარდებ ვიტყვი რო რობოტი საჭმელს ვერ ჭამს და მას ფუნქცია ფაუერ ჭირდება , ანუ უკვე ვიჭედები რა პროტოკოლში

protocol Worker {
    func work()
    func eat()
}

class HumanWorker: Worker {
    func work() {
        print("ვმუშაობ")
    }
    
    func eat() {
        print("ვჭამ")
    }
}

class RobotWorker: Worker {
    func work() {
        print("ვმუშაობ")
    }
    
    func eat() {
        print("ვჭამ")
    }
}
