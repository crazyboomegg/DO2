//
//  SceneDelegate.swift
//  DO2
//
//  Created by 江柏毅 on 2023/3/14.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = MapViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}

