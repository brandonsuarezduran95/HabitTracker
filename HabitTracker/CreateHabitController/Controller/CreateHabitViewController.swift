//
//  CreateHabitViewController.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/21/23.
//

import UIKit

class CreateHabitViewController: UITabBarController {
    
    let habitCreationController = HabitCreationViewController()
    let tableView = UITableView()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupViews()
        setUpTableView()
        setupButton()
    }
}
