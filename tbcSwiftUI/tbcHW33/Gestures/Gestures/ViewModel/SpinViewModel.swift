//
//  SpinViewModel.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//

import SwiftUI

final class SpinViewModel: ObservableObject {
    @Published var offset = CGSize.zero
    @Published var endPosition = CGPoint.zero
    @Published var rotationAngle: Double = 0
    let rotationMultiplier: Double = 0.7
    let screenWidth = UIScreen.main.bounds.width


    func onDragChanged(_ drag: DragGesture.Value) {
        offset = drag.translation
        rotationAngle = Double(offset.height) * rotationMultiplier
    }

    func onDragEnded(_ drag: DragGesture.Value) {
        endPosition.x = drag.location.x - screenWidth / 2
        endPosition.y = drag.location.y - screenWidth / 2
        offset = .zero
    }
}

