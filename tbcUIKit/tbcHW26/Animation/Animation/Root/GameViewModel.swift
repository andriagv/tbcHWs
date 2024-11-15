//
//  GameViewModel.swift
//  Animation
//
//  Created by Apple on 15.11.24.
//

import CoreGraphics
import UIKit

final class GameViewModel: ObservableObject {
    private var game = Game()
    public var playerPosition: CGPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 4)
    private let screenSize = UIScreen.main.bounds.size
    private var speed = 5

    var score: Int {
        game.score
    }

    var gameOver: Bool {
        game.gameOver
    }

    var foods: [Food] {
        game.foods
    }

    var maxBananas: [MaxBanana] {
        game.maxBananas
    }

    func movePlayer(to position: CGPoint) {
        let clampedX = max(50, min(position.x, screenSize.width - 50))
        let clampedY = max(50, min(position.y, screenSize.height - 50))
        playerPosition = CGPoint(x: clampedX, y: clampedY)
    }

    func dropFood() {
        game.dropFood(screenWidth: screenSize.width, screenHeight: screenSize.height)
    }

    func dropMaxBanana() {
        game.dropMaxBanana(screenWidth: screenSize.width, screenHeight: screenSize.height)
    }

    func updateFoodPositions() {
        for index in game.foods.indices {
            game.foods[index].position.y -= CGFloat(speed)

            let playerFrame = CGRect(
                x: playerPosition.x - 50,
                y: playerPosition.y - 50,
                width: 100,
                height: 100
            )

            let foodFrame = CGRect(
                x: game.foods[index].position.x - 25,
                y: game.foods[index].position.y - 25,
                width: 50,
                height: 50
            )

            if playerFrame.intersects(foodFrame) && !game.foods[index].isCaught {
                game.foods[index].isCaught = true
                game.score += 1
                speed += 2
            }
        }

        game.foods.removeAll { $0.isCaught || $0.position.y < 0 }
        game.checkGameOver()
    }

    func updateMaxBananaPositions() {
        game.updateMaxBananas()

        for index in game.maxBananas.indices {
            let playerFrame = CGRect(
                x: playerPosition.x - 50,
                y: playerPosition.y - 50,
                width: 100,
                height: 100
            )

            let maxBananaFrame = CGRect(
                x: game.maxBananas[index].position.x - 25,
                y: game.maxBananas[index].position.y - 25,
                width: 50,
                height: 50
            )

            if playerFrame.intersects(maxBananaFrame) && !game.maxBananas[index].isCaught {
                game.maxBananas[index].isCaught = true
                game.score += 5
            }
        }

        game.checkGameOver()
    }

    func resumeGame() {
        game.paused = false
    }

    func pauseGame() {
        game.paused = true
    }

    func resetGame() {
        game.resetGameOver()
        game.paused = false
    }
}
