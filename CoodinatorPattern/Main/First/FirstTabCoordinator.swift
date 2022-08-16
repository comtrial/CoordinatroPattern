//
//  FirstTabCoordinator.swift
//  CoodinatorPattern
//
//  Created by 최승원 on 2022/08/15.
//

import UIKit
import SwiftUI

class FirstTabCoordinator: Coordinator {
    //TODO: checkout why rootVC is UINavigationContorller not VC or TabVC in TabCoordinator
    //TODO: How to `lazy` work
    var rootViewController = UINavigationController()
    
    lazy var firstViewController: FirstViewController = {
        let vc = FirstViewController()
        vc.title = "First Title"
        return vc
    }()

    func start() {
//        rootViewController = UIHostingController(rootView: FirstDetailView())
        rootViewController.setViewControllers([firstViewController], animated: true)
    }
}
