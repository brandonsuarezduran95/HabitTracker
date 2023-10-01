//
//  MainTabBarController.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/21/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let notificationCenter = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupControllerViews()
        setupRightButton()
        subscribeToNotificationCenter()
        
        // Default Value for title
        title = "Home"
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
}
