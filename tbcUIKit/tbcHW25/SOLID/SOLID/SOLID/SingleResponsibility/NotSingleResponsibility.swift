//
//  NotSingleResponsibility.swift
//  SOLID
//
//  Created by Apple on 13.11.24.
//

import Foundation


/*ბარემ წინა დავალება წამოვიღოთ,
 სადაც ცალსახად არ ვიტვალისწინებ SRP ს,
 ეს სამი ფუნქცია სხვადასხვა პასუხისმგებლობას ატარებენ
 ისევე როგორც ინახავენ ასევე ამოწმებენ პასუხებს
 */


final class AnswerViewModel {
    
    func saveAnswer(_ answer: String) {
        UserDefaults.standard.set(answer, forKey: userDefaultsKey)

        if answer == question.answer {
            correctAnswersCount += 1
        } else {
            incorrectAnswersCount += 1
        }
    }
    
    func retrieveSavedAnswer() -> String? {
        return UserDefaults.standard.string(forKey: userDefaultsKey)
    }
    
    func checkAnswer(_ answer: String) {
            if answer == question.answer {
                correctAnswersCount += 1
            } else {
                incorrectAnswersCount += 1
            }
        }
}
