//
//  HabitCreationViewController + tableViewDataSource + tableViewDelegate.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/24/23.
//

import UIKit

extension HabitCreationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var tableHeight: CGFloat = 50
        
        switch indexPath.row {
        case 0:
            tableHeight = 40.0
        default:
            break
        }
        return tableHeight
    }
}

extension HabitCreationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell") as! TitleTableViewCell
            
        default:
            cell = UITableViewCell()
        }
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
   
}
