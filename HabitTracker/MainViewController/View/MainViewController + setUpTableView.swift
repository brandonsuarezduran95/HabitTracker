//
//  MainViewController + setUpTableView.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/21/23.
//

import UIKit

extension MainViewController {
    func setUpTableView() {
        view.addSubview(tableView)
        
        // delegates
        tableView.delegate = self
        tableView.dataSource = self
        
        //decorators
        tableView.backgroundColor = .systemBlue
        tableView.register(HabitTableViewCell.self, forCellReuseIdentifier: "HabitTableViewCell")
        
        // constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
