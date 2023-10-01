//
//  HabitCreationViewController + setupSecondRow.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/26/23.
//

import UIKit

extension HabitCreationViewController {
    func setupSecondRow() {
        setupNameTitleLabel()
        setupNameTextField()
    }
    
    fileprivate func setupNameTitleLabel() {
        
        nameTitle.text = "Name"
        nameTitle.textAlignment = .left
        nameTitle.font = .systemFont(ofSize: 16, weight: .medium)
        nameTitle.textColor = .black
        
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTitle.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: Constants.verticalSpacing + 10),
            nameTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.horizontalSpacing)
        ])
    }
    
    fileprivate func setupNameTextField() {
        
        nameTextView.font = .systemFont(ofSize: 16, weight: .light)
        nameTextView.layer.cornerRadius = 5
        nameTextView.backgroundColor = .clear
        nameTextView.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        nameTextView.layer.borderWidth = 2
        nameTextView.textContainer.maximumNumberOfLines = 1
        
        nameTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextView.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: Constants.verticalSpacing),
            nameTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.horizontalSpacing),
            nameTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.horizontalSpacing),
            nameTextView.heightAnchor.constraint(equalToConstant: 34),
        ])
        
    }
}
