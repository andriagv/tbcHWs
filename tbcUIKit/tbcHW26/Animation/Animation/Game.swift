//
//  Food.swift
//  Animation
//
//  Created by Apple on 15.11.24.
//

import UIKit

struct Food {
    var position: CGPoint
    var isCaught: Bool = false
}


struct MaxBanana {
    var position: CGPoint
    var isCaught: Bool = false
    var rotationAngle: CGFloat = 0
    var velocity: CGVector
}


struct Game {
    var foods: [Food] = []
    var maxBananas: [MaxBanana] = []
    var score: Int = 0
    var gameOver: Bool = false
    var paused: Bool = false
    var cheackScore = 20
    

    mutating func dropFood(screenWidth: CGFloat, screenHeight: CGFloat) {
        let randomX = CGFloat.random(in: 0...screenWidth)
        let newFood = Food(position: CGPoint(x: randomX, y: screenHeight))
        foods.append(newFood)
    }

    mutating func dropMaxBanana(screenWidth: CGFloat, screenHeight: CGFloat) {
        let randomX = CGFloat.random(in: 0...screenWidth)
        let velocity = CGVector(dx: CGFloat.random(in: -3...3), dy: -5)
        let newMaxBanana = MaxBanana(position: CGPoint(x: randomX, y: screenHeight), velocity: velocity)
        maxBananas.append(newMaxBanana)
    }

    mutating func updateMaxBananas() {
        for index in maxBananas.indices {
            maxBananas[index].position.x += maxBananas[index].velocity.dx
            maxBananas[index].position.y += maxBananas[index].velocity.dy
            maxBananas[index].rotationAngle += 0.1
        }
        maxBananas.removeAll { $0.position.y < 0 }
    }

    mutating func checkGameOver() {
        if score >= cheackScore {
            gameOver = true
            cheackScore += 20
        }
    }

    mutating func resetGameOver() {
        gameOver = false
        foods.removeAll()
        maxBananas.removeAll()
    }
}
