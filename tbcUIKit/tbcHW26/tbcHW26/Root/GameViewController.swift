//
//  GameViewController.swift
//  tbcHW26
//
//  Created by Apple on 15.11.24.
//


import UIKit
import SpriteKit
import izziGradient

final class GameViewController: UIViewController {
    private var viewModel = GameViewModel()
    private var gameScene: GameScene?
    private var scoreLabel: UILabel?
    let gradientView = IzziLinearGradient()
    
    private let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("დაწყება", for: .normal)
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.orange.withAlphaComponent(0.8)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientView()
        setupStartGameButton()
    }
    
    private func setupGradientView() {
        gradientView.gradientColors = [UIColor.systemGreen, UIColor.systemOrange]
        gradientView.colorLocations = [0.0, 1.0]
        gradientView.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientView.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        gradientView.frame = view.bounds
        gradientView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(gradientView)
    }
    
    private func setupStartGameButton() {
        gradientView.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: gradientView.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 120),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.startGame()
        }), for: .touchUpInside)
    }
    
    private func startGame() {
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
        scoreLabel?.textColor = .orange
        scoreLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(scoreLabel ?? UILabel())
    }
    
    private func startGameLoop() {
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.viewModel.updatePositions()
            self.viewModel.checkCollision()
            self.gameScene?.updateFoods()
            self.updateScore()
            
            if self.viewModel.gameOver {
                self.showContinueDialog()
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.viewModel.dropFood(screenWidth: self?.view.bounds.width ?? 0, screenHeight: self?.view.bounds.height ?? 0)
        }
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [weak self] _ in
            self?.viewModel.dropMaxBanana(screenWidth: self?.view.bounds.width ?? 0, screenHeight: self?.view.bounds.height ?? 0)
        }
    }
    
    private func updateScore() {
        scoreLabel?.text = "Score: \(viewModel.score)"
    }
    
    private func showContinueDialog() {
        let alert = UIAlertController(title: "წააგე", message: "თუგინდა კიდე გატესტე", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ხელახლა ცდა", style: .default, handler: { [weak self] _ in
            self?.viewModel.resetGame()
        }))
        alert.addAction(UIAlertAction(title: "თამაშის დასრულება", style: .cancel, handler: { [weak self] _ in
            self?.gameOver()
        }))
        present(alert, animated: true)
    }
    
    private func gameOver() {
        let alert = UIAlertController(title: "მაიმუნმა შეჭამა \(viewModel.score) ბანანი", message: "მადლობა თამაშისთვის", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "გამოსვლა აპიდან", style: .default, handler: { _ in
            exit(0)
        }))
        present(alert, animated: true)
    }
}
