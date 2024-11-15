//
//  GameViewController.swift
//  Animation
//
//  Created by Apple on 15.11.24.
//

import UIKit
import SpriteKit

final class GameViewController: UIViewController {
    private var viewModel = GameViewModel()
    private var gameScene: GameScene?
    private var scoreLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGameScene()
        setupScoreLabel()
        startGameLoop()
    }

    private func setupGameScene() {
        gameScene = GameScene(size: view.bounds.size, viewModel: viewModel)
        gameScene?.scaleMode = .resizeFill
        let skView = SKView(frame: view.bounds)
        skView.presentScene(gameScene)
        skView.ignoresSiblingOrder = true
        view.addSubview(skView)
    }

    private func setupScoreLabel() {
        scoreLabel = UILabel(frame: CGRect(x: 20, y: 50, width: 150, height: 30))
        //scoreLabel?.text = "Score: 0"
        scoreLabel?.textColor = .black
        scoreLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(scoreLabel ?? UILabel())
    }

    private func startGameLoop() {
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            self.viewModel.updateFoodPositions()
            self.viewModel.updateMaxBananaPositions()
            self.gameScene?.updateFoods()
            self.updateScore()

            if self.viewModel.gameOver {
                self.showContinueDialog()
            }
        }

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.viewModel.dropFood()
        }

        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [weak self] _ in
            self?.viewModel.dropMaxBanana()
        }
    }

    private func updateScore() {
        scoreLabel?.text = "Score: \(viewModel.score)"
    }

    private func showContinueDialog() {
        let alert = UIAlertController(title: "დანაყრდა", message: "გავაგრძელოთ მაიმუნის გასუქება?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "მოდი ჰა", style: .default, handler: { [weak self] _ in
            self?.viewModel.resetGame() // თამაში განახლდეს
        }))
        alert.addAction(UIAlertAction(title: "ვსო მეყო", style: .cancel, handler: { [weak self] _ in
            self?.gameOver()
        }))
        present(alert, animated: true)
    }

    private func gameOver() {
        let alert = UIAlertController(title: "მადლობა თამაშისთვის", message: "მაიმუნის მონაგარი ბანანია: \(viewModel.score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "დახურვა", style: .default, handler: { _ in

                exit(0)
            }))
        present(alert, animated: true)
    }
}
