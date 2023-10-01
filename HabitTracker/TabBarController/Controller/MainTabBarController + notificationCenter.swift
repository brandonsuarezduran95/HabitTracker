//
//  MainTabBarController + notificationCenter.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/23/23.
//

import UIKit

extension MainTabBarController {
    
    func subscribeToNotificationCenter() {
        notificationCenter.addObserver(self, selector: #selector(didReceiveName), name: .navigationName, object: nil)
    }
    
    @objc fileprivate func didReceiveName(_ notification: Notification) {
        print("did receive notification")
    }
}
