//
//  MainViewController + tableViewDataSource.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/21/23.
//

import UIKit

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        habitViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let habitCell = tableView.dequeueReusableCell(withIdentifier: "HabitTableViewCell", for: indexPath) as! HabitTableViewCell
        let viewModel: NewHabitViewModel = habitViewModels[indexPath.row]
        habitCell.configure(with: viewModel)
        
        return habitCell
    }
    
    
}
