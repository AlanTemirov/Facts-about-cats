//
//  SceneDelegate.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var viewControllerAssembly: ViewControllerAssembly!
    var embeddedContainer: EmbeddedContainer!
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        let window = UIWindow(windowScene: windowScene)
        
        embeddedContainer = EmbeddedContainer()
        viewControllerAssembly = ViewControllerAssembly(embeddedContainer: embeddedContainer)
        
        window.rootViewController = viewControllerAssembly.makeRootViewController()
        
        self.window = window
        window.makeKeyAndVisible()
    }
    
}

