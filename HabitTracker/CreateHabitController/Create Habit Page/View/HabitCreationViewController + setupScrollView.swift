//
//  HabitCreationViewController + setupScrollView.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/26/23.
//

import UIKit

extension HabitCreationViewController {
    func setupScrollView() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
