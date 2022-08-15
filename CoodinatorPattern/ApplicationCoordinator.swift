//
//  ApplicationCoordinator.swift
//  CoodinatorPattern
//
//  Created by 최승원 on 2022/08/15.
//

import SwiftUI
import UIKit

// MARK: ScenDelegate 에서 Coordinator 의 기능 분리
class ApplicationCoordinator: Coordinator{
    let window: UIWindow
    
    var childCoordinators = [Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        //MARK: window 의 rootVC 를 onboardingCoordinator 를 통해 onboardingContenView 등록
//        let onboardingCoordinator = OnboardingCoordinator()
//        onboardingCoordinator.start()
//
//        window.rootViewController = onboardingCoordinator.rootViewController
        
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        self.childCoordinators = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController
    }
}
