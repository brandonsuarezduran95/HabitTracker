//
//  CreateHabitViewController + setupTableView.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/23/23.
//

import UIKit

extension CreateHabitViewController {
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: 20),
        ])
        
    }
}
