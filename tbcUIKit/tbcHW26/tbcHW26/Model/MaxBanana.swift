//
//  MaxBanana.swift
//  tbcHW26
//
//  Created by Apple on 15.11.24.
//

import CoreGraphics
import Foundation

struct MaxBanana: GameElement {
    var position: CGPoint
    var velocity: CGVector
    var isCaught: Bool = false
    var rotationAngle: CGFloat = 0.0

    mutating func updatePosition(fallSpeed: CGFloat) {
        position.x += velocity.dx
        position.y += velocity.dy - fallSpeed
        rotationAngle += 0.1
    }
}
