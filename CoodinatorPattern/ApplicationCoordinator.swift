//
//  ApplicationCoordinator.swift
//  CoodinatorPattern
//
//  Created by 최승원 on 2022/08/15.
//

import SwiftUI
import UIKit
import Combine


// MARK: ScenDelegate 에서 Coordinator 의 기능 분리
class ApplicationCoordinator: Coordinator{
    let window: UIWindow
    
    var childCoordinators = [Coordinator]()
    
    let hasSeenOnboarding = CurrentValueSubject<Bool,Never>(false)
    var subscription = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        //MARK: UserDefault set & Combine set
        setupOnboardingValue()
        //MARK: window 의 rootVC 를 Coordinator 를 통해 View 등록
        hasSeenOnboarding
            .sink {  [weak self] hasSeen in
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
            }
            .store(in: &subscription)
    }
    
    
    func setupOnboardingValue() {
        
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key) // Default of false
        hasSeenOnboarding.send(value)
        
        hasSeenOnboarding
            .sink { (value) in
                //MARK: UserDefault 등록
                UserDefaults.standard.setValue(value, forKey: key)
            }
            .store(in: &subscription)

        
    }
}
