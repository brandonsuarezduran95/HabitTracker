//
//  HabitTableViewCell + setupViews.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 9/30/23.
//

import UIKit

extension HabitTableViewCell {
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(countLabel)
        setupUIElements()
    }
    
    fileprivate func setupUIElements() {
        setupTitleLabel()
        setupDescriptionLabel()
        setupCountLabel()
    }
    
    // MARK: Title
    fileprivate func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: Constants.titleFontSize, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.text = "Title"
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.verticalSpacing),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.horizontalSpacing),
        ])
    }
    
    // MARK: - Description Label
    fileprivate func setupDescriptionLabel() {
        
        descriptionLabel.text = "Description"
        descriptionLabel.font = .systemFont(ofSize: Constants.descriptionFontSize, weight: .thin)
        descriptionLabel.textAlignment = .left
        descriptionLabel.textColor = .black
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.verticalSpacing),
            descriptionLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.verticalSpacing),
        ])
    }
    
    fileprivate func setupCountLabel() {
        
        countLabel.text = "1"
        countLabel.font = .systemFont(ofSize: Constants.countFontSize, weight: .bold)
        countLabel.textAlignment = .center
        countLabel.textColor = .black
        
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            countLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.horizontalSpacing)
        ])
    }
    
    fileprivate enum Constants {
        // Spacings
        static let horizontalSpacing: CGFloat = 30
        static let verticalSpacing: CGFloat = 15
        // Font Sizes
        static let titleFontSize: CGFloat = 18
        static let descriptionFontSize: CGFloat = 15
        static let countFontSize: CGFloat = 16
    }
    
}
