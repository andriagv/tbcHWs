//
//  PlayerManager.swift
//  tbcHW26
//
//  Created by Apple on 15.11.24.
//

import UIKit

final class PlayerManager {
    var position: CGPoint
    let size: CGSize
    
    init(position: CGPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 4),
         size: CGSize = CGSize(width: 120, height: 120)) {
        self.position = position
        self.size = size
    }
    
    func movePlayer(to position: CGPoint, screenWidth: CGFloat, screenHeight: CGFloat) {
        let clampedX = max(size.width / 2, min(position.x, screenWidth - size.width / 2))
        let clampedY = max(size.height / 2, min(position.y, screenHeight - size.height / 2))
        self.position = CGPoint(x: clampedX, y: clampedY)
    }
    
    func playerFrame() -> CGRect {
        return CGRect( x: position.x - size.width / 2, y: position.y - size.height / 2, width: size.width, height: size.height
        )
    }
}

