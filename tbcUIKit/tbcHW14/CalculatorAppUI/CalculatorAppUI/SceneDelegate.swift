//
//  SceneDelegate.swift
//  UIProgramMatically
//
//  Created by Apple on 13.10.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        let vc = ProfileVC()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
    }
}



