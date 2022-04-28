//
//  ApplicationCoordinator.swift
//  CooordinatorProject
//
//  Created by Bohdan Tkachenko on 4/26/22.
//

import SwiftUI
import UIKit
import Combine

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    
    var childCoordinators = [Coordinator]()
    
    let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow){
        self.window = window
    }
    
    func start() {
        setupOnboardingValues()
        hasSeenOnboarding.sink { [weak self] hasSeen in
            if hasSeen {
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self?.childCoordinators = [mainCoordinator]
                self?.window.rootViewController = mainCoordinator.rootViewController
            } else if let hasSeenOnboarding = self?.hasSeenOnboarding {
                let onboardingCoordinator = OnboardingCoordinator(hasSeenOnboarding: hasSeenOnboarding)
                onboardingCoordinator.start()
                self?.childCoordinators = [onboardingCoordinator]
                self?.window.rootViewController = onboardingCoordinator.rootViewController
            }
        }.store(in: &subscriptions)
    }
    
    func setupOnboardingValues() {
        
        //storing and loading of state/data
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key) //default of false
        hasSeenOnboarding.send(value)
        
        hasSeenOnboarding
            .filter({ $0 })
            .sink { (value) in
                UserDefaults.standard.setValue(value, forKey: key)
            }.store(in: &subscriptions)
    }
}
