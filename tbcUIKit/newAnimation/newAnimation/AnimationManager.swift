//
//  AnimationManager.swift
//  newAnimation
//
//  Created by Apple on 16.11.24.
//


import UIKit

class AnimationManager {
    
    private var animator: UIViewPropertyAnimator?
    
    func loadBanana(bananaImageView: UIImageView?) {
        animator = UIViewPropertyAnimator(duration: 3, dampingRatio: 0.4) {
            bananaImageView?.frame = CGRect(x: bananaImageView?.frame.origin.x ?? 0, y: 100, width: 50, height: 50)
        }
        animator?.startAnimation()
    }
    
    func loadCharacter(characterImageView: UIImageView?, view: UIView) {
        animator = UIViewPropertyAnimator(duration: 3, dampingRatio: 1) {
            characterImageView?.frame = CGRect(x: 0, y: view.bounds.height - 120, width: 100, height: 100)
        }
        animator?.startAnimation()
    }
}
