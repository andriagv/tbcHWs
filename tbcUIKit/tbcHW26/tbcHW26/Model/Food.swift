//
//  Food.swift
//  tbcHW26
//
//  Created by Apple on 15.11.24.
//

import Foundation

struct Food: GameElement {
    var position: CGPoint
    var isCaught: Bool = false
    
    mutating func updatePosition(fallSpeed: CGFloat) {
        position.y -= fallSpeed
    }
}
