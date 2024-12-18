//
//  RotateViewModel.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//

import Foundation
import SwiftUI

final class RotateViewModel: ObservableObject {
    @Published var rotationAngle: Angle = .degrees(0)

    func onRotateChanged(_ angle: Angle) {
        rotationAngle = angle
    }

    func onRotateEnded(_ angle: Angle) {
        rotationAngle = angle
    }
}

