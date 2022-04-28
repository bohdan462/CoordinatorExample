//
//  SecondTabCoordinator.swift
//  CooordinatorProject
//
//  Created by Bohdan Tkachenko on 4/26/22.
//

import UIKit

class SecondTabCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    
    lazy var secondViewController: SecondViewController = {
        let vc = SecondViewController()
        vc.title = "Second"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
