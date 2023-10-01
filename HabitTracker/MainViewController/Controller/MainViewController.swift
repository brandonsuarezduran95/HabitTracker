//
//  ViewController.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 6/1/23.
//

import UIKit

class MainViewController: UIViewController {
    
    let notificationCenter = NotificationCenter.default
    
    // UIElements
    let tableView = UITableView()
    
    // Variables
    var habitViewModels: [NewHabitViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpController()
        setUpTableView()
        subscribeToNotificationCenter()
        #warning(
        "Task 1: whenever a new habit is created, display it in the UI"
        )
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
}

