//
//  OnboardingCoordinator.swift
//  CoodinatorPattern
//
//  Created by 최승원 on 2022/08/15.
//

import Foundation
import UIKit
import SwiftUI
import Combine


class OnboardingCoordinator: Coordinator {
    var rootViewController = UIViewController()
    
    var hasSeenOnboarding: CurrentValueSubject<Bool,Never>
    
    init(hasSeenOnboarding: CurrentValueSubject<Bool,Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    
    func start() {
        print("hi")
        //MARK: set hasSeenOnboarding UserDefault true using combine
        let view = OnboardingView { [weak self] in
            self?.hasSeenOnboarding.send(true)
            print("aa")
        }
        //MARK: SwiftUI ContentView 를 UIKit 의 ViewController 에 등록해주는 방법
        rootViewController = UIHostingController(rootView: view)
    }
}
