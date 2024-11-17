//
//  GameViewModel.swift
//  newAnimation
//
//  Created by Apple on 16.11.24.
//



import UIKit

final class GameViewModel {
    
    private var gameModel = GameModel()
    private var displayLink: CADisplayLink?

    var scoreUpdated: ((Int) -> Void)?
    var gameOver: (() -> Void)?
    var bananaPositionUpdated: ((CGPoint) -> Void)?
    var showMessage: ((String) -> Void)?
    
    var characterFrame = CGRect.zero
    
    func resetBananaPosition(viewWidth: CGFloat, bananaViewWidth: CGFloat) {
        self.gameModel.bananaPosition = CGPoint(x: CGFloat.random(in: 0...(viewWidth - bananaViewWidth)), y: 0)
        bananaPositionUpdated?(gameModel.bananaPosition)
        gameModel.bananaSpeed += 1
    }
    
    func startBananaFall() {
        displayLink = CADisplayLink(target: self, selector: #selector(updateBananaPosition))
        displayLink?.add(to: .main, forMode: .common)
    }

    @objc func updateBananaPosition() {
        guard gameModel.score < 10 else { return }

        gameModel.bananaPosition.y += gameModel.bananaSpeed
        bananaPositionUpdated?(gameModel.bananaPosition)
        checkForCollision(characterFrame: characterFrame)
        
        if gameModel.bananaPosition.y > UIScreen.main.bounds.height {
            gameOver?()
            stopBananaFall()
        }
    }

    func checkForCollision(characterFrame: CGRect) {
        let bananaRect = CGRect(x: gameModel.bananaPosition.x, y: gameModel.bananaPosition.y, width: 50, height: 50)
        
        if bananaRect.intersects(characterFrame) {
            gameModel.isBananaCaught = true
            gameModel.score += 1
            scoreUpdated?(gameModel.score)
  
            if gameModel.score == 10 {
                showMessage?("მოიგე \(gameModel.score) ბანანი")
                stopBananaFall()
            } else {
                resetBananaPosition(viewWidth: UIScreen.main.bounds.width, bananaViewWidth: 50)
            }
        }
    }
    
    func stopBananaFall() {
        displayLink?.invalidate()
        displayLink = nil
    }
}
