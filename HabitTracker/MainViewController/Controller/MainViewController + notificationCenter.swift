//
//  MainViewController + notificationCenter.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 9/29/23.
//

import UIKit

extension MainViewController {
    func subscribeToNotificationCenter() {
        notificationCenter.addObserver(self, selector: #selector(didReceiveNewHabit), name: .newHabit, object: nil)
    }

    
    @objc fileprivate func didReceiveNewHabit(_ notification: Notification) {
        guard let newHabitViewModel = notification.object as? NewHabitViewModel else { return }
        habitViewModels.append(newHabitViewModel)
        print(
            "\n>---------------------<",
            "\nReceived new habit in MainViewController",
            "\nName: \(newHabitViewModel.name)",
            "\nDescription: \(newHabitViewModel.description)",
            "\nDays: \(newHabitViewModel.days)",
            "\nTimes Per Day: \(newHabitViewModel.timesPerDay)",
            "\n>---------------------<"
        )
    }
}
