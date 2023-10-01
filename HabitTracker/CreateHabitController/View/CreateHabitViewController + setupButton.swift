//
//  CreateHabitViewController + setupButton.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/23/23.
//

import UIKit

extension CreateHabitViewController {
    
    fileprivate enum Constants {
        static let buttonWidth: CGFloat = 50
        static let horizontalSpacing: CGFloat = -20
        static let cornerRadius: CGFloat = 25
        static let borderWidth: CGFloat = 2
    }
    
    func setupButton() {
        
        button.contentMode = .scaleAspectFit
        button.layer.borderWidth = Constants.borderWidth
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = Constants.cornerRadius
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        let image = UIImage.init(systemName: "plus.circle.fill")
        
        button.setImage(image, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            button.heightAnchor.constraint(equalToConstant: Constants.buttonWidth),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,  constant: Constants.horizontalSpacing),
        ])
    }
    
    @objc fileprivate func didTapButton() {
        
        habitCreationController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(habitCreationController, animated: true)

    }
}
