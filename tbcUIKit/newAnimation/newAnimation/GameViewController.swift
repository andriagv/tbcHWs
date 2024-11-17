//
//  GameViewController.swift
//  newAnimation
//
//  Created by Apple on 16.11.24.
//


import UIKit

class GameViewController: UIViewController {

    private var viewModel = GameViewModel()
    private var characterImageView: UIImageView?
    private var bananaImageView: UIImageView?
    private var scoreLabel: UILabel?
    private var messageLabel: UILabel?
    private var animationManager: AnimationManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupBindings()
        animationManager = AnimationManager()
        viewModel.startBananaFall()
    }

    func setupUI() {
        view.backgroundColor = .white

        characterImageView = UIImageView(image: UIImage(named: "monkey"))
        characterImageView?.frame = CGRect(x: view.bounds.midX - 50, y: view.bounds.height - 120, width: 100, height: 100)
        view.addSubview(characterImageView ?? UIView())
        
        bananaImageView = UIImageView(image: UIImage(named: "banana"))
        view.addSubview(bananaImageView ?? UIView())
        
        scoreLabel = UILabel(frame: CGRect(x: 20, y: 50, width: 200, height: 40))
        scoreLabel?.textColor = .black
        view.addSubview(scoreLabel ?? UILabel())
       
        messageLabel = UILabel(frame: CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 150, height: 50))
        messageLabel?.textColor = .red
        view.addSubview(messageLabel ?? UILabel())
    }

    func setupBindings() {
        viewModel.scoreUpdated = { [weak self] score in
            self?.scoreLabel?.text = "Score: \(score)"
        }
        
        viewModel.bananaPositionUpdated = { [weak self] position in
            self?.bananaImageView?.frame = CGRect(x: position.x, y: position.y, width: 50, height: 50)
        }
        
        viewModel.showMessage = { [weak self] message in
            self?.messageLabel?.text = message
        }
        
        viewModel.gameOver = { [weak self] in
            self?.messageLabel?.text = "წააგე"
        }
    }

    func loadBanana() {
        animationManager?.loadBanana(bananaImageView: bananaImageView)
    }
    
    func loadCharacter() {
        animationManager?.loadCharacter(characterImageView: characterImageView, view: view)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: view)
        characterImageView?.frame.origin.x = touchLocation.x - (characterImageView?.frame.width ?? 10) / 2
        viewModel.characterFrame = characterImageView?.frame ?? CGRectZero
    }
}
