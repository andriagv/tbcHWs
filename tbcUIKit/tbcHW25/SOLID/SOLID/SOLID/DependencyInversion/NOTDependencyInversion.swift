//
//  NOTDependencyInversion.swift
//  SOLID
//
//  Created by Apple on 13.11.24.
//

import Foundation



class DatabaseService {
    func fetchData() -> [String] {
        ["Data1", "Data2", "Data3"]
    }
}

class DataProcessor {
    private let databaseService = DatabaseService()
    
    func processData() {
        let data = databaseService.fetchData()
        print("Processing \(data)")
    }
}

/*
 აქ DataProcessor პირდაპირ იყენებს DatabaseService-ს ანუ DataProcessor ში ხო ვქმნი DatabaseService ობიექტს და მერე მაქედან ვწვდები fetchData, რაც არღვევს DIP-ს, ანუ მაღალი დონის მოდული დამოკიდებულია დაბალი დონის იმპლემენტაციაზე
 */

//რაც ართულებს კოდის ცვლილებას , და ჩვენ პროტოკოლზე დამოკიდებული რო გვქონოდა გაცილებით მარტივი იქნებოდა ყველაფერი , რის მაგალითსაც სწორში განახებ , იმედია ჯერ არასწორს კითხულობ და მერე სწორდს დ
