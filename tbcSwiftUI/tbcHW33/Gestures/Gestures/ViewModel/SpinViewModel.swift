//
//  SpinViewModel.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//

import SwiftUI

final class SpinViewModel: ObservableObject {
    @Published var model: SpinModel
    let rotationMultiplier: Double = 0.5
    
    init(model: SpinModel = SpinModel()) {
        self.model = model
    }
    
    func onDragChanged(_ drag: DragGesture.Value) {
        model.offset = drag.translation
        model.rotationAngle = Double(model.offset.height) * rotationMultiplier
    }
}


