//
//  GameScene.swift
//  tbcHW26
//
//  Created by Apple on 15.11.24.
//


import SpriteKit

final class GameScene: SKScene {
    private var viewModel: GameViewModel
    private var foodManager: FoodManager
    private var playerNode: SKSpriteNode?
    
    init(size: CGSize, viewModel: GameViewModel) {
        self.viewModel = viewModel
        self.foodManager = viewModel.foodManager
        super.init(size: size)
        setupPlayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        self.size = view.bounds.size
        backgroundColor = .clear
        backgroundImage()
    }
    
    private func backgroundImage() {
       
        let texture = SKTexture(imageNamed: "background")
        let backgroundNode = SKSpriteNode(texture: texture)
        
        backgroundNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        backgroundNode.size = CGSize(width: size.width * 2, height: size.height)
        backgroundNode.zPosition = -1
        
        addChild(backgroundNode)
    }
    
    private func setupPlayer() {
        let texture = SKTexture(imageNamed: "monkey")
        let spriteNode = SKSpriteNode(texture: texture)
        spriteNode.size = viewModel.playerManager.size
        spriteNode.position = viewModel.playerManager.position
        addChild(spriteNode)
        playerNode = spriteNode
    }
    
    func updateFoods() {
        for child in children where child is SKSpriteNode && child.zPosition != -1 {
            child.removeFromParent()
        }
        
        if let playerNode = playerNode {
            addChild(playerNode)
        }
        
        for food in foodManager.foods {
            if !food.isCaught {
                let texture = SKTexture(imageNamed: "banana")
                let foodNode = SKSpriteNode(texture: texture)
                foodNode.size = CGSize(width: 50, height: 50)
                foodNode.position = food.position
                addChild(foodNode)
            }
        }
        
        for maxBanana in foodManager.maxBananas {
            if !maxBanana.isCaught {
                let texture = SKTexture(imageNamed: "bananas")
                let bananaNode = SKSpriteNode(texture: texture)
                bananaNode.size = CGSize(width: 50, height: 50)
                bananaNode.position = maxBanana.position
                bananaNode.zRotation = maxBanana.rotationAngle
                addChild(bananaNode)
            }
        }
        
        playerNode?.position = viewModel.playerManager.position
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            viewModel.playerManager.movePlayer(to: touchLocation, screenWidth: size.width, screenHeight: size.height)
        }
    }
}
