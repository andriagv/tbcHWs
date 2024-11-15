//
//  FoodManager.swift
//  tbcHW26
//
//  Created by Apple on 15.11.24.
//


import UIKit
import CoreGraphics

final class FoodManager {
    private(set) var foods: [Food] = []
    private(set) var maxBananas: [MaxBanana] = []
    private(set) var fallSpeed: CGFloat = 5.0
    
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
    
    func checkCollision(playerFrame: CGRect, onScoreUpdate: (Int) -> Void) -> Bool {
        var gameOver = false
        
        for index in foods.indices {
            let foodFrame = CGRect(x: foods[index].position.x - 25, y: foods[index].position.y - 25, width: 50, height: 50)
            
            if playerFrame.intersects(foodFrame) && !foods[index].isCaught {
                foods[index].isCaught = true
                onScoreUpdate(1)
                fallSpeed += 2
            }
        }
        
        for index in maxBananas.indices {
            let bananaFrame = CGRect(x: maxBananas[index].position.x - 25, y: maxBananas[index].position.y - 25, width: 50, height: 50)
            
            if playerFrame.intersects(bananaFrame) && !maxBananas[index].isCaught {
                maxBananas[index].isCaught = true
                onScoreUpdate(5)
                fallSpeed += 3
            }
        }
        
        if foods.contains(where: { $0.position.y < 0 && !$0.isCaught }) || maxBananas.contains(where: { $0.position.y < 0 && !$0.isCaught }) {
            gameOver = true
        }
        
        foods.removeAll { $0.isCaught || $0.position.y < 0 }
        maxBananas.removeAll { $0.isCaught || $0.position.y < 0 }
        
        return gameOver
    }
    
    func reset() {
        foods.removeAll()
        maxBananas.removeAll()
        fallSpeed = 5.0
    }
}
