//
//  SecondTabCoordinator.swift
//  CoodinatorPattern
//
//  Created by 최승원 on 2022/08/16.
//

import UIKit

class SecondTabCoodinator: Coordinator {
    var rootViewController = UINavigationController()
    
    lazy var secondViewController: SecondViewController = {
        let vc = SecondViewController()
        vc.title = "Second Title"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: true)
    }
}
