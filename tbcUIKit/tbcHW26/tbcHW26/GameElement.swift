//
//  GameElement.swift
//  tbcHW26
//
//  Created by Apple on 15.11.24.
//


import CoreGraphics
import Foundation

protocol GameElement {
    var position: CGPoint { get set }
    var isCaught: Bool { get set }
    mutating func updatePosition(fallSpeed: CGFloat)
}

struct Food: GameElement {
    var position: CGPoint
    var isCaught: Bool = false

    mutating func updatePosition(fallSpeed: CGFloat) {
        position.y -= fallSpeed
    }
}

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
