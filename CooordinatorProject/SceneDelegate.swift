//
//  SceneDelegate.swift
//  CooordinatorProject
//
//  Created by Bohdan Tkachenko on 4/26/22.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var applicationCoordinator: ApplicationCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let applicationCoordinator = ApplicationCoordinator(window: window)
            applicationCoordinator.start()
            //Set up UIView as root controller
//            window.rootViewController = ViewController()
            self.applicationCoordinator = applicationCoordinator
            window.makeKeyAndVisible()
        }
    }
}

