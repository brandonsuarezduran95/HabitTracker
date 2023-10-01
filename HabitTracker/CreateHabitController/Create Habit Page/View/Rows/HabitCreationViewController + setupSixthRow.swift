//
//  HabitCreationViewController + setupSixthRow.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 8/22/23.
//

import UIKit

extension HabitCreationViewController {
    func setupSixthRow() {
        setupEndDateLabel()
        setupEndDatePicker()
    }
    
    fileprivate func setupEndDateLabel() {
        endDateLabel.text = "End Date"
        endDateLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        endDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            endDateLabel.topAnchor.constraint(equalTo: startDateLabel.bottomAnchor, constant: Constants.verticalSpacing * 2),
            endDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.horizontalSpacing)
        ])
    }
    
    fileprivate func setupEndDatePicker() {
        
        endDatePicker.datePickerMode = .date
        endDatePicker.preferredDatePickerStyle = .compact
        
        endDatePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            endDatePicker.centerYAnchor.constraint(equalTo: endDateLabel.centerYAnchor),
            endDatePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.horizontalSpacing),
        ])
    }
}
