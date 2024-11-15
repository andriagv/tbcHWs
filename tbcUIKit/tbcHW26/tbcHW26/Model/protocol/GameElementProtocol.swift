//
//  GameElementProtocol.swift
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

