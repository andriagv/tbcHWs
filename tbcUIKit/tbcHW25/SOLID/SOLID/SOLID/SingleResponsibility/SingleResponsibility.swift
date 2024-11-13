//
//  SingleResponsibility.swift
//  SOLID
//
//  Created by Apple on 13.11.24.
//

import Foundation

/* ლოგიკა არის ის რომ AnswerStorage კლასი ინახავს მონაცემებს
და AnswerValidator -ს ლოგიკა არის სისწორის შემოწმება */

final class AnswerStorage {
    
    func saveAnswer(_ answer: String) {
        UserDefaults.standard.set(answer, forKey: userDefaultsKey)
    }
    
    func retrieveSavedAnswer() -> String? {
        return UserDefaults.standard.string(forKey: userDefaultsKey)
    }
}

final class AnswerValidator {
    
    func checkAnswer(_ answer: String) {
        if answer == question.answer {
            correctAnswersCount += 1
        } else {
            incorrectAnswersCount += 1
        }
    }
}


/*
 მოკლედ მტავარი დასკვნა რომ თითოეულ კლას ან ფუნქციას უნდა ჰქონდეს მხოლოდ ერთი პასუხისმგებლობა ანუ ფუნქცია უნდა აკეთებდეს მხოლოდ ერთ კონკრეტულ საქმეს.
 
 რაც კოდს უფრო მარტივად შესაცვლელს ხდის სამომავლოდ , და ნუ წასაკიტხადაც გაცილებით მარტივია რა 
 */
