//
//  HabitTableViewCell + setUpViewModel.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 9/29/23.
//

import UIKit

extension HabitTableViewCell {
    
    func configure(with viewModel: NewHabitViewModel) {
        titleLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        countLabel.text = String(viewModel.timesPerDay)
    }
    
}
