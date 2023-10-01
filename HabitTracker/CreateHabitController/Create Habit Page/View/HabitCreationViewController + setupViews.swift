//
//  HabitCreationViewController + setupViews.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/24/23.
//

import UIKit

extension HabitCreationViewController {
    
    func setupViews() {
        view.addSubview(scrollView)
        // First Row
        scrollView.addSubview(closeButton)
        scrollView.addSubview(titleLabel)
        
        /// Friend Challenge Button
        scrollView.addSubview(friendChallengeButton)
        
        /// Self Challenge Button
        scrollView.addSubview(selfChallengeButton)
        
        // Second Row
        scrollView.addSubview(nameTitle)
        scrollView.addSubview(nameTextView)
        
        // Third Row
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(descriptionTextView)
        
        // Fourth Row
        scrollView.addSubview(frequencyLabel)
        scrollView.addSubview(frequencySegmentedControl)
        
        scrollView.addSubview(daySelectionLabel)
        scrollView.addSubview(daysStackView)
        
        scrollView.addSubview(timesPerDayLabel)
        scrollView.addSubview(timesPerDayTextField)
        scrollView.addSubview(timesPerDayStepper)
        
        // Fifth Row
        /// Enable when implementing
//        scrollView.addSubview(startDateLabel)
//        scrollView.addSubview(startDatePicker)
        
        // Sixth Row
        /// Enable when implementing
//        scrollView.addSubview(endDateLabel)
//        scrollView.addSubview(endDatePicker)
        
        // Advance Button
        scrollView.addSubview(advanceButton)
        
        // Create Habit Button
        view.addSubview(createHabitButton)
        
    }
    
    struct Constants {
        static let horizontalSpacing: CGFloat = 20
        static let verticalSpacing: CGFloat = 10
    }
}
