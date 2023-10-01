//
//  HabitCreationViewController + setupThirdRow.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 8/10/23.
//

import UIKit

extension HabitCreationViewController {
    func setupThirdRow() {
        setupDescriptionLabel()
        setupDescriptionTextField()
    }
    
    fileprivate func setupDescriptionLabel() {
        descriptionLabel.text = "Description"
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: Constants.verticalSpacing),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.horizontalSpacing)
        ])
    }
    
    fileprivate func setupDescriptionTextField() {

        descriptionTextView.font = .systemFont(ofSize: 16, weight: .light)
        descriptionTextView.layer.borderWidth = 2
        descriptionTextView.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        descriptionTextView.backgroundColor = .clear
        descriptionTextView.layer.cornerRadius = 5
        
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.verticalSpacing),
            descriptionTextView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: Constants.horizontalSpacing),
            descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.horizontalSpacing),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
