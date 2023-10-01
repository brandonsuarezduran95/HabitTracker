//
//  HabitCreationViewController + setupFirstRow.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/26/23.
//

import UIKit

/// First Row, includes the title and the button
extension HabitCreationViewController {
    func setupFirstRow() {
        setupCloseButton()
        setupTitleLabel()
    }
    
    fileprivate func setupCloseButton() {
        closeButton.contentHorizontalAlignment = .fill
        closeButton.contentVerticalAlignment = .fill
        closeButton.imageView?.contentMode = .scaleToFill
        
        closeButton.setImage( .init(systemName: "xmark.circle"), for: .normal)
        closeButton.imageView?.tintColor = .systemBlue
        
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Constants.verticalSpacing),
            closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.horizontalSpacing),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    fileprivate func setupTitleLabel() {
        titleLabel.text = "Create Habit"
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0),
            titleLabel.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor),
        ])
    }
    
    @objc fileprivate func didTapCloseButton() {
        navigationController?.popViewController(animated: true)
        navigationController?.navigationBar.isHidden = false
    }
}
