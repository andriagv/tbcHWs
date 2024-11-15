//
//  GameViewModel.swift
//  tbcHW26
//
//  Created by Apple on 15.11.24.
//


import UIKit
import CoreGraphics

final class GameViewModel: ObservableObject {
    var playerManager = PlayerManager()
    var foodManager = FoodManager()
    private(set) var score: Int = 0
    private(set) var gameOver: Bool = false
    private(set) var isPaused: Bool = false
    
    func updatePositions() {
        foodManager.updatePositions()
    }
    
    func dropFood(screenWidth: CGFloat, screenHeight: CGFloat) {
        foodManager.dropFood(screenWidth: screenWidth, screenHeight: screenHeight)
    }
    
    func dropMaxBanana(screenWidth: CGFloat, screenHeight: CGFloat) {
        foodManager.dropMaxBanana(screenWidth: screenWidth, screenHeight: screenHeight)
    }
    
    func checkCollision() {
        gameOver = foodManager.checkCollision(playerFrame: playerManager.playerFrame()) { [weak self] points in
            self?.score += points
        }
    }
    
    func resetGame() {
        score = 0
        gameOver = false
        isPaused = false
        foodManager.reset()
        playerManager.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 4)
    }
}
