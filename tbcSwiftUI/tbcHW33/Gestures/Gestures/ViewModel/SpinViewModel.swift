//
//  SpinViewModel.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//

import SwiftUI

final class SpinViewModel: ObservableObject {
    @Published var offset = CGSize.zero
    @Published var rotationAngle: Double = 0
    let rotationMultiplier: Double = 0.5

    func onDragChanged(_ drag: DragGesture.Value) {
        offset = drag.translation
        rotationAngle = Double(offset.height) * rotationMultiplier
    }

}

