//
//  HabitCreationViewController + setupFifthRow.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 8/20/23.
//

import UIKit

extension HabitCreationViewController {
    func setupFifthRow() {
        setupStartDateLabel()
        setupStartDatePicker()
    }
    
    fileprivate func setupStartDateLabel() {
        startDateLabel.text = "Start Date"
        startDateLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        startDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startDateLabel.topAnchor.constraint(equalTo: timesPerDayTextField.bottomAnchor, constant: Constants.verticalSpacing * 2),
            startDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.horizontalSpacing)
        ])
    }
    
    fileprivate func setupStartDatePicker() {
        
        startDatePicker.datePickerMode = .date
        startDatePicker.preferredDatePickerStyle = .compact
        
        startDatePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startDatePicker.centerYAnchor.constraint(equalTo: startDateLabel.centerYAnchor),
            startDatePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.horizontalSpacing),
        ])
    }
    
}
