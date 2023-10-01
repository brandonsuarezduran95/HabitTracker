//
//  NewHabitViewModel.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 9/20/23.
//

import Foundation

struct NewHabitViewModel {
    enum Days: String {
        case Monday
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        case Saturday
        case Sunday
        case All
    }
    
    var name: String
    var description: String
    var days: [Days]
    var timesPerDay: Int
    
    func printViewModel() {
        var toPrintDays: [String] = []
        days.forEach { day in
            toPrintDays.append(day.rawValue)
        }
        
        print("NewHabitViewModel","\nTitle: \(name)", "\nDescription: \(description)", "\nDays: \(toPrintDays)", "\nFrequency: \(timesPerDay)")
    }
}
