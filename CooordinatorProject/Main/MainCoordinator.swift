//
//  MainCoardinator.swift
//  CooordinatorProject
//
//  Created by Bohdan Tkachenko on 4/26/22.
//

import SwiftUI
import UIKit
import Combine

class MainCoordinator: Coordinator {
    
    var rootViewController = UITabBarController()
    
    var childCoordinator = [Coordinator]()
    
    init() {
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .lightGray
    }
    
    func start() {
        
        let firstCoordinator = FirstTabCoordinator()
        firstCoordinator.start()
        self.childCoordinator.append(firstCoordinator)
        let firstViewController = firstCoordinator.rootViewController
        setup(vc: firstViewController, title: "First Tab", imageName: "paperplane", selectedImageName: "paperplane.fill")
        
        let secondCoordinator = SecondTabCoordinator()
        secondCoordinator.start()
        self.childCoordinator.append(secondCoordinator)
        let secondViewController = secondCoordinator.rootViewController
        setup(vc: secondViewController, title: "Second Tab", imageName: "bell", selectedImageName: "bell.fill")
        
        //read how programmaticly set ui view root controller
        self.rootViewController.viewControllers = [firstViewController, secondCoordinator.rootViewController]
        
    }
    
    func setup(vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
}
