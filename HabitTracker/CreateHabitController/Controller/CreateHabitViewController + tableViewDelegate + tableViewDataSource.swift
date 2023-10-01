//
//  CreateHabitViewController + tableViewDelegate + tableViewDataSource.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/23/23.
//

import UIKit

extension CreateHabitViewController: UITableViewDelegate {
    
}

extension CreateHabitViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}
