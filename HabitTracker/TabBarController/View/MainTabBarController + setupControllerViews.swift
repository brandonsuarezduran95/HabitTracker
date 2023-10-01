//
//  MainTabBarController + setupControllerViews.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/21/23.
//

import UIKit

extension MainTabBarController {
    
    fileprivate enum ControllerType {
        case main
    }
    
    func setupControllerViews() {
        // main view controller
        let mainController = createController(type: .main)

        setViewControllers([mainController], animated: true)
    }
    
    fileprivate func createController(type: ControllerType) -> UIViewController {
        var controller: UIViewController?
        
        switch type {
        case .main:
            controller = MainViewController()
            controller?.tabBarItem.image = .init(systemName: "house.fill")
        }
        
        guard let controller = controller else {
            return UIViewController()
        }
        return controller
    }
}
