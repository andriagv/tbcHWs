//
//  TrashViewModel.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//


import SwiftUI

final class TrashViewModel: ObservableObject {
    @Published var offset = CGSize.zero
    @Published var endPosition = CGPoint.zero
    @Published var isHidden = false
    let trashPosition = CGPoint(x: UIScreen.main.bounds.width * 5 / 6, y: UIScreen.main.bounds.height * 3 / 4)
    let detectionRadius: CGFloat = 80

    func onDragChanged(_ drag: DragGesture.Value) {
        offset = drag.translation
    }

    func onDragEnded(_ drag: DragGesture.Value) {
        endPosition.x += offset.width
        endPosition.y += offset.height
        offset = .zero
        
        let fileCenter = CGPoint(
            x: UIScreen.main.bounds.width / 2 + endPosition.x,
            y: UIScreen.main.bounds.height / 2 + endPosition.y
        )
        
        let distance = hypot(fileCenter.x - trashPosition.x, fileCenter.y - trashPosition.y)
        
        if distance <= detectionRadius {
            isHidden = true
        }
    }
}
