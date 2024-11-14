//
//  DependencyInversion.swift
//  SOLID
//
//  Created by Apple on 13.11.24.
//

import Foundation

//ამის მთავარი მიზანია რო მაღალი დონის მოდულები რო არ დაექრდნონ დაბალი დონის მოდულებს



protocol EmailServiceProtocol {
    func sendEmail(to recipient: String, message: String)
}

class SMTPService: EmailServiceProtocol {
    func sendEmail(to recipient: String, message: String) {
    }
}

class EmailNotification {
    let emailService: EmailServiceProtocol
    
    init(emailService: EmailServiceProtocol) {
        self.emailService = emailService
    }
    
    func notifyUser() {
        emailService.sendEmail(to: "ადსფ@ფეაფ", message: "ქფქ")
    }
}

//MARK: - მეორე მაგალიტიც





protocol DataServiceProtocol {
    func fetchData() -> [String]
}

class DatabaseService: DataServiceProtocol {
    func fetchData() -> [String] {
        ["Data1", "Data2", "Data3"]
    }
}

class APIService: DataServiceProtocol {
    func fetchData() -> [String] {
        ["AP1", "AP2", "AP3"]
    }
}

// dataService მუდმივა უბრალოდ ვიცით რო კონკრეტული პროტოკოლის მქონეა ანუ ვიცით რო მას გააჩნია fetchData და არაა კონკრეტული ტიპის ობიექტი, რაც პასუხების მრავალფეროვნებას მოგცემს


class DataProcessor {
    
    private let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    func processData() {
        let data = dataService.fetchData()
    }
}

// ამის მორალი არი ის რო როცა დაბალი დონით მაღალ დონეს პირდაპირ ვუკავშირდებით ვიზღუდებით 
