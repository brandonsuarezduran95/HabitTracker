//
//  HabitCreationViewController + requireSlotCompletion.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 8/31/23.
//

import UIKit


extension HabitCreationViewController {
    
    // if there are elements that are not filled, then display a visual representation of the user's required filling
    
    func requireSlotCompletion() -> Bool {
        // All the required slot views go here
        let requiredSlots: [Any] = [nameTextView, descriptionTextView, dayButtons, timesPerDayTextField]
        
        // All the required filled slots go here
        let name = requiresNameField()
        let description = requiresDescriptionField()
        let frequency = requiresFrequency()
        let timesPerDay = requiresTimerPerDay()
        
        let required = [name, description, frequency, timesPerDay]
        
        // Alert controller
        let alertController = UIAlertController(title: "", message: "Complete the required fields", preferredStyle: .alert)
        
        let alertAnimationWorkItem = DispatchWorkItem {
        
            for (index, view) in requiredSlots.enumerated() {
                if required[index] {
                    UIView.animate(withDuration: 0.4) {
                        if let view = view as? UIView {
                            view.layer.borderColor = UIColor.systemRed.cgColor
                        }
                        
                        if let views = view as? [UIButton] {
                            views.forEach { button in
                                button.layer.borderColor = UIColor.systemRed.cgColor
                            }
                        }
                    }
                }
            }
        }
        
        let dismissAlertAnimationWorkItem = DispatchWorkItem {
            for (index, view) in requiredSlots.enumerated() {
                if required[index] {
                    
                    UIView.animate(withDuration: 0.4) {
                        if let view = view as? UIView {
                            view.layer.borderColor = UIColor(named: "borderColor")?.cgColor
                        }
                        if let views = view as? [UIButton] {
                            views.forEach { button in
                                button.layer.borderColor = UIColor(named: "borderColor")?.cgColor
                            }
                        }
                    }
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            dismissAlertAnimationWorkItem.perform()
        }
        
        alertController.addAction(cancelAction)
        
        if required.contains(true) {
            self.present(alertController, animated: true) {
                alertAnimationWorkItem.perform()
            }
        }
        
        let requireSlotCompletion = required.contains { requiredSlot in
            requiredSlot == true
        }
        
        return requireSlotCompletion
    }
    
    // MARK: - Name TextField
    fileprivate func requiresNameField() -> Bool {
        // 1.- Name Label
        // this should be activated when the create habit button is pressed
        
        #warning("Refactor when user inputs spaces before typing any character, i.e:   Ese")
        /// TextField should not be empty
        let isEmptyName = nameTextView.text == ""
        
        /// TextField should not be composed only of white spaces
        let onlyWhiteSpacesName: Bool = {
            var result = true
            nameTextView.text?.forEach { character in
                if character != " " {
                    result = false
                }
            }
            return result
        }()
        
        print("\n----requiresNameField()----")
        print("Empty Title Label: \(isEmptyName)")
        print("Only white spaces in Title Label: \(onlyWhiteSpacesName)")
        
        let nameTextViewFilled: Bool = {
            var result = false
            if (isEmptyName == false) && (onlyWhiteSpacesName == false) {
                result = true
            }
            return result
        }()
        
        print("the name text field is filled up: \(nameTextViewFilled)")
        
        return !nameTextViewFilled
    }
    
    // MARK: - Description TextView
    
    fileprivate func requiresDescriptionField() -> Bool {
        
        // 1.- The description is empty
        let isEmptyDescription = descriptionTextView.text == ""
        
        // 2.- There is only white spaces in the description
        let onlyWhiteSpacesDescription: Bool = {
            var result = true
            descriptionTextView.text?.forEach { character in
                if character != " " {
                    result = false
                }
            }
            return result
        }()
        
        print("\n----requiresDescriptionField()----")
        print("Empty Description Box: \(isEmptyDescription)")
        print("Only white spaces Description: \(onlyWhiteSpacesDescription)")
        
        let isDescriptionFilled: Bool = {
            var result = false
            if (isEmptyDescription == false) && (onlyWhiteSpacesDescription == false) {
                result = true
            }
            return result
        }()
        print("The Description field is filled up: \(isDescriptionFilled)")
        
        return !isDescriptionFilled
    }
    
    // MARK: - Frequency
    fileprivate func requiresFrequency() -> Bool {
        // 1 .- if segmented control is on Daily and there are no day buttons selected
        
        let isDailySelected = frequencySegmentedControl.selectedSegmentIndex == 0
        
        let noDayButtonSelected: Bool = {
        !dayButtons.contains { button in
            let isSelected = button.isSelected == true
            return isSelected
            }
        }()
        
        print("\n-----requiresFrequency()-----")
        print("Daily Segment Selected: \(isDailySelected)")
        print("No Day Buttons Selected: \(noDayButtonSelected)")
        
        let isFrequencyFilled: Bool = {
            var result = false
            if isDailySelected == true && noDayButtonSelected == false {
                result = true
            } else if isDailySelected == false {
                return true
            }
            
            return result
        }()
        
        print("Is Frequency Filled: \(isFrequencyFilled)")
        
        return !isFrequencyFilled
    }
    
    // MARK: - Times Per day
    
    fileprivate func requiresTimerPerDay() -> Bool {
        // if slot is empty
        guard let isSLotEmpty = timesPerDayTextField.text?.isEmpty else { return true }
        print("\n----requiresTimerPerDay()----")
        print("Empty Times per day Field: \(isSLotEmpty)")
        return isSLotEmpty
    }
    
}

