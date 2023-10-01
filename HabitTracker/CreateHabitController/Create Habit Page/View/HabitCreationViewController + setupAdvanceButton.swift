//
//  HabitCreationViewController + setupAdvanceButton.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 8/23/23.
//

import UIKit

extension HabitCreationViewController {
    func setupAdvanceButton() {
        advanceButton.setTitle("Advance", for: .normal)
        advanceButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        advanceButton.titleLabel?.textAlignment = .center
        advanceButton.setTitleColor(.systemBlue, for: .normal)
        advanceButton.backgroundColor = .clear
        advanceButton.layer.borderColor = UIColor.systemBlue.cgColor
        advanceButton.layer.borderWidth = 2
        advanceButton.layer.cornerRadius = 5
        
        advanceButton.isHidden = true
        
        advanceButton.addTarget(self, action: #selector(showAdvanceOptions), for: .touchUpInside)
        
        advanceButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            advanceButton.topAnchor.constraint(equalTo: timesPerDayTextField.bottomAnchor, constant: Constants.verticalSpacing),
            advanceButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.horizontalSpacing),
            advanceButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    @objc fileprivate func showAdvanceOptions(_ sender: UIButton) {
        
    }
}
