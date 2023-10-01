//
//  MainTabBarController + setupRightButton.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/23/23.
//

import UIKit

extension MainTabBarController {
    
    func setupRightButton() {
        let rightButton:  UIBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(didTapButton))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc fileprivate func didTapButton() {
        let createHabitController = CreateHabitViewController()
        createHabitController.tabBar.isHidden = true
        navigationController?.pushViewController(createHabitController, animated: true)
    }
    
}
