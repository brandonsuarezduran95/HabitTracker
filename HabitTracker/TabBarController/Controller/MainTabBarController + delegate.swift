//
//  MainTabBarController + delegate.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/23/23.
//

import UIKit

extension MainTabBarController {
    
    fileprivate enum ControllerTitle: String {
        case main = "Home"
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch self.selectedIndex {
        case 0:
            title = ControllerTitle.main.rawValue
        default:
            break
        }
    }
}

