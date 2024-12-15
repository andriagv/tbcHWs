//
//  ActivityDetailsViewModel.swift
//  ListsAndGrids
//
//  Created by Apple on 16.12.24.
//

import Foundation

final class ActivityDetailsViewModel {
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.locale = Locale(identifier: "ka_GE")
        return formatter.string(from: date)
    }
}


