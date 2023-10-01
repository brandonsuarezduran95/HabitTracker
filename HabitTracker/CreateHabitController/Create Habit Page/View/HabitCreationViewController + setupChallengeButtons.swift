//
//  HabitCreationViewController + setupChallengeButtons.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 8/23/23.
//

import UIKit

extension HabitCreationViewController {
    func setupChallengeButtons() {
        setupFriendChallengeButton()
        setupSelfChallengeButton()
    }
    
    fileprivate func setupFriendChallengeButton() {
        friendChallengeButton.setImage(.init(systemName: "person.crop.circle.fill.badge.plus"), for: .normal)
        friendChallengeButton.contentHorizontalAlignment = .fill
        friendChallengeButton.contentVerticalAlignment = .fill
        friendChallengeButton.imageView?.contentMode = .scaleToFill
        friendChallengeButton.imageView?.tintColor = .systemBlue
        
        friendChallengeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            friendChallengeButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Constants.verticalSpacing),
            friendChallengeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -Constants.horizontalSpacing),
            friendChallengeButton.widthAnchor.constraint(equalToConstant: 35),
            friendChallengeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    fileprivate func setupSelfChallengeButton() {
        selfChallengeButton.setImage(.init(systemName: "mustache.fill"), for: .normal)
        selfChallengeButton.contentHorizontalAlignment = .fill
        selfChallengeButton.contentVerticalAlignment = .fill
        selfChallengeButton.imageView?.contentMode = .scaleToFill
        selfChallengeButton.imageView?.tintColor = .black
        
        selfChallengeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selfChallengeButton.centerYAnchor.constraint(equalTo: friendChallengeButton.centerYAnchor),
            selfChallengeButton.trailingAnchor.constraint(equalTo: friendChallengeButton.leadingAnchor, constant: -Constants.horizontalSpacing),
            selfChallengeButton.heightAnchor.constraint(equalToConstant: 20),
            selfChallengeButton.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
}
