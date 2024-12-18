//
//  HoldViewModel.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//


import Foundation
import SwiftUI

final class HoldViewModel: ObservableObject {
    @Published var model: HoldModel
    
    init(model: HoldModel = HoldModel()) {
        self.model = model
    }
    
    func onLongPressEnded() {
        model.isFill = false
    }
    
    func onDragEnded() {
        model.isFill = true
    }
}
