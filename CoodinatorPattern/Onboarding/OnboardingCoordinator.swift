//
//  OnboardingCoordinator.swift
//  CoodinatorPattern
//
//  Created by 최승원 on 2022/08/15.
//

import Foundation
import UIKit
import SwiftUI

class OnboardingCoordinator: Coordinator {
    var rootViewController = UIViewController()
    
    func start() {
        let view = OnboardingView {
        
        }
        //MARK: SwiftUI ContentView 를 UIKit 의 ViewController 에 등록해주는 방법
        rootViewController = UIHostingController(rootView: view)
    }
}
