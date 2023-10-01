//
//  HabitCreationViewController + setupCreateHabitButton.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 8/22/23.
//

import UIKit

extension HabitCreationViewController {
    func setupCreateHabitButton() {
        createHabitButton.setTitle("Create Habit", for: .normal)
        createHabitButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        createHabitButton.backgroundColor = .systemBlue
        createHabitButton.titleLabel?.textColor = .black
        createHabitButton.layer.cornerRadius = 15
        createHabitButton.titleLabel?.textAlignment = .center
        createHabitButton.addTarget(self, action: #selector(didTapCreateHabit), for: .touchUpInside)
        
        createHabitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createHabitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.horizontalSpacing),
            createHabitButton.heightAnchor.constraint(equalToConstant: 39),
            createHabitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.horizontalSpacing),
            createHabitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.verticalSpacing*3)
        ])
    }
    
    @objc
    func didTapCreateHabit(sender: UIButton) {
        
        print(">---------------------<")
        print("Tapped Create Button")
        let requiresSlotCompletion = requireSlotCompletion()
        print("\nRequires Slot Completion: \(requiresSlotCompletion)")
        print(">---------------------<")
        
        if requiresSlotCompletion == false {
            let name: String = nameTextView.text.uppercased()
            let description: String = descriptionTextView.text.uppercased()
            let days: [NewHabitViewModel.Days] = {
                var selectedDays: [NewHabitViewModel.Days] = []
                dayButtons.forEach { button in
                    if button.isSelected {
                        switch button.tag {
                            case 1:
                                selectedDays.append(.Sunday)
                            case 2:
                                selectedDays.append(.Monday)
                            case 3:
                                selectedDays.append(.Tuesday)
                            case 4:
                                selectedDays.append(.Wednesday)
                            case 5:
                                selectedDays.append(.Thursday)
                            case 6:
                                selectedDays.append(.Friday)
                            case 7:
                                selectedDays.append(.Saturday)
                            default:
                                break
                            }
                    }
                }
                
                if (frequencySegmentedControl.selectedSegmentIndex == 0 ) && (selectedDays.count == 7) {
                    selectedDays = [.All]
                }
                
                if frequencySegmentedControl.selectedSegmentIndex == 1 {
                    selectedDays = [.All]
                }

                return selectedDays
            }()
            
            let timesPerDay: Int = Int(timesPerDayTextField.text ?? "1") ?? 1
            
            let newHabitViewModel = NewHabitViewModel(
                name: name,
                description: description,
                days: days,
                timesPerDay: timesPerDay
            )
            
            print(
                "\n>---------------------<",
                "\nNew Habit View Model",
                "\nName: \(newHabitViewModel.name)",
                "\nDescription: \(newHabitViewModel.description)",
                "\nDays: \(newHabitViewModel.days)",
                "\nTimes Per Day: \(newHabitViewModel.timesPerDay)",
                "\n>---------------------<"
            )
            notificationCenter.post(name: .newHabit, object: newHabitViewModel)
            navigationController?.popToRootViewController(animated: true)
            navigationController?.navigationBar.isHidden = false
        }
    }
}
