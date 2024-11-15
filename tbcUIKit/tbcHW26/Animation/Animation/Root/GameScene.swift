//
//  GameScene.swift
//  Animation
//
//  Created by Apple on 15.11.24.
//

import SpriteKit

class GameScene: SKScene {
    private var viewModel: GameViewModel
    private var playerNode: SKSpriteNode?

    init(size: CGSize, viewModel: GameViewModel) {
        self.viewModel = viewModel
        super.init(size: size)
        backgroundColor = .white
        setupPlayer()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupPlayer() {
        let texture = SKTexture(imageNamed: "monkey")
        let spriteNode = SKSpriteNode(texture: texture)
        spriteNode.size = CGSize(width: 100, height: 100)
        spriteNode.position = viewModel.playerPosition
        addChild(spriteNode)
        playerNode = spriteNode
    }

    func updateFoods() {
        removeAllChildren()
        addChild(playerNode!)

        for food in viewModel.foods {
            if !food.isCaught {
                let texture = SKTexture(imageNamed: "banana")
                let foodNode = SKSpriteNode(texture: texture)
                foodNode.size = CGSize(width: 50, height: 50)
                foodNode.position = food.position
                addChild(foodNode)
            }
        }

        for maxBanana in viewModel.maxBananas {
            if !maxBanana.isCaught {
                let texture = SKTexture(imageNamed: "MaxBanana")
                let maxBananaNode = SKSpriteNode(texture: texture)
                maxBananaNode.size = CGSize(width: 50, height: 50)
                maxBananaNode.position = maxBanana.position
                maxBananaNode.zRotation = maxBanana.rotationAngle // MaxBanana-ის ბრუნვა
                addChild(maxBananaNode)
            }
        }

        playerNode?.position = viewModel.playerPosition
    }


    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            viewModel.movePlayer(to: touchLocation)
        }
    }
}
