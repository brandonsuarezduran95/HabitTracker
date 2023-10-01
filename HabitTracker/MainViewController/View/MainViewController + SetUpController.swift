//
//  MainViewController + SetUpController.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/21/23.
//

import UIKit

extension MainViewController {
    func setUpController() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Home"
        tabBarItem.title = ""
    }
}
