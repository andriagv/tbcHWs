//
//  GameViewModel.swift
//  tbcHW26
//
//  Created by Apple on 15.11.24.
//


import UIKit
import CoreGraphics

final class GameViewModel: ObservableObject {
    private(set) var score: Int = 0
    var playerPosition: CGPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 4)
    private(set) var foods: [Food] = []
    private(set) var maxBananas: [MaxBanana] = []
    private(set) var gameOver: Bool = false
    private(set) var isPaused: Bool = false
    private(set) var fallSpeed: CGFloat = 5.0

    func movePlayer(to position: CGPoint) {
        let clampedX = max(50, min(position.x, UIScreen.main.bounds.width - 50))
        let clampedY = max(50, min(position.y, UIScreen.main.bounds.height - 50))
        playerPosition = CGPoint(x: clampedX, y: clampedY)
    }

    func dropFood(screenWidth: CGFloat, screenHeight: CGFloat) {
        let randomX = CGFloat.random(in: 50...(screenWidth - 50))
        let newFood = Food(position: CGPoint(x: randomX, y: screenHeight))
        foods.append(newFood)
    }

    func dropMaxBanana(screenWidth: CGFloat, screenHeight: CGFloat) {
        let randomX = CGFloat.random(in: 50...(screenWidth - 50))
        let velocity = CGVector(dx: CGFloat.random(in: -3...3), dy: -5)
        let newBanana = MaxBanana(position: CGPoint(x: randomX, y: screenHeight), velocity: velocity)
        maxBananas.append(newBanana)
    }

    func updatePositions() {
        for index in foods.indices {
            foods[index].updatePosition(fallSpeed: fallSpeed)
        }
        for index in maxBananas.indices {
            maxBananas[index].updatePosition(fallSpeed: fallSpeed)
        }
    }

    func checkCollision() {
        let playerFrame = CGRect(
            x: playerPosition.x - 50,
            y: playerPosition.y - 50,
            width: 100,
            height: 100
        )

        
        for index in foods.indices {
            let foodFrame = CGRect(
                x: foods[index].position.x - 25,
                y: foods[index].position.y - 25,
                width: 50,
                height: 50
            )

            if playerFrame.intersects(foodFrame) && !foods[index].isCaught {
                foods[index].isCaught = true
                score += 1
                fallSpeed += 2
            }
        }
        for index in maxBananas.indices {
            let bananaFrame = CGRect(
                x: maxBananas[index].position.x - 25,
                y: maxBananas[index].position.y - 25,
                width: 50,
                height: 50
            )

            if playerFrame.intersects(bananaFrame) && !maxBananas[index].isCaught {
                maxBananas[index].isCaught = true
                score += 5
                fallSpeed += 3
            }
        }

        if foods.contains(where: { $0.position.y < 0 && !$0.isCaught }) {
            gameOver = true
        }
        
        foods.removeAll { $0.isCaught || $0.position.y < 0 }
        maxBananas.removeAll { $0.isCaught || $0.position.y < 0 }
    }
    func resetGame() {
        score = 0
        gameOver = false
        isPaused = false
        fallSpeed = 5.0
        foods.removeAll()
        maxBananas.removeAll()
    }
}
