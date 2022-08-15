//
//  SceneDelegate.swift
//  CoodinatorPattern
//
//  Created by 최승원 on 2022/08/15.
//

import SwiftUI
import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    //MARK: 아래 window 선언 부를 Coordinator 에게 위임
    var applicationCoordinator: ApplicationCoordinator?
    //    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowscene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowscene)
            let applicationCoordinator = ApplicationCoordinator(window: window)
            applicationCoordinator.start()
            
            self.applicationCoordinator = applicationCoordinator
            window.makeKeyAndVisible()
        }
//        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

