//
//  MainCoordinator.swift
//  CoodinatorPattern
//
//  Created by 최승원 on 2022/08/15.
//

import Foundation
import UIKit
import SwiftUI

class MainCoordinator: Coordinator {
    //MARK: 여러개의 TabBar 를 가지는 경우의 Coordinator pattern 적용
    var rootViewController: UITabBarController
    
    var childCoordinators = [Coordinator]()
    
    init() {
        self.rootViewController = UITabBarController()
//        rootViewController.tabBar.backgroundColor = .lightGray
    }
    
    func start() {
        // MARK: FirstTab set
        let firstCoordinator = FirstTabCoordinator()
        firstCoordinator.start()
        
        self.childCoordinators.append(firstCoordinator)
        let firstViewContoroller = firstCoordinator.rootViewController
        setup(vc: firstViewContoroller, title: "First Tab", imageName: "paperplane", selectedImageName: "paperplane.fill")
        
        // MARK: SecondTab set
        let secondCoordinator = SecondTabCoodinator()
        secondCoordinator.start()
        
        self.childCoordinators.append(secondCoordinator)
        let secondViewController = secondCoordinator.rootViewController
        setup(vc: secondViewController, title: "Second Tab", imageName: "bell", selectedImageName: "bell.fill")
        
        self.rootViewController.viewControllers = [firstViewContoroller, secondViewController]
    }
    
    func setup(vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
}
