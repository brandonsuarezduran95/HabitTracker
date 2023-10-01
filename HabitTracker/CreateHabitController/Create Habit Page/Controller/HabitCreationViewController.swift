//
//  HabitCreationViewController.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 7/24/23.
//

import UIKit

class HabitCreationViewController: UIViewController {

    let scrollView = UIScrollView()
    
    // MARK: - Challenge yourself Button
    let selfChallengeButton = UIButton()
    
    // MARK: - Challenge a friend Button
    let friendChallengeButton = UIButton()
    
    // MARK: - First Row
    let closeButton = UIButton()
    let titleLabel = UILabel()
    
    // MARK: - Second Row
    let nameTitle = UILabel()
    let nameTextView = UITextView()
    
    // MARK: - Third Row
    let descriptionLabel = UILabel()
    let descriptionTextView = UITextView()
    
    // MARK: - Fourth Row
    let frequencyLabel = UILabel()
    let frequencySegmentedControl = UISegmentedControl(items: ["Daily", "Weekly"])
    /// day buttons
    let daySelectionLabel = UILabel()
    let daysStackView = UIStackView()
    
    lazy var buttonSunday = makeDayOfWeekButton(title: "S", tag: 1)
    lazy var buttonMonday = makeDayOfWeekButton(title: "M", tag: 2)
    lazy var buttonTuesday = makeDayOfWeekButton(title: "T", tag: 3)
    lazy var buttonWednesday = makeDayOfWeekButton(title: "W", tag: 4)
    lazy var buttonThursday = makeDayOfWeekButton(title: "T", tag: 5)
    lazy var buttonFriday = makeDayOfWeekButton(title: "F", tag: 6)
    lazy var buttonSaturday = makeDayOfWeekButton(title: "S", tag: 7)
    
    lazy var dayButtons = [
        buttonSunday,
        buttonMonday,
        buttonTuesday,
        buttonWednesday,
        buttonThursday,
        buttonFriday,
        buttonSaturday,
    ]
    
    /// times per day selection
    let timesPerDayLabel = UILabel()
    let timesPerDayTextField = UITextField()
    let timesPerDayStepper = UIStepper()
    
    // MARK: - Fifth Row
    
    let startDateLabel = UILabel()
    let startDatePicker = UIDatePicker()
    
    // MARK: - Sixth Row
    
    let endDateLabel = UILabel()
    let endDatePicker = UIDatePicker()
    
    // MARK: - Create Habit Button
    let createHabitButton = UIButton()
    
    // MARK: - Advance Button
    let advanceButton = UIButton()
    
    // MARK: - Variables
    var isButtonPressed: Bool = false
    var notificationCenter = NotificationCenter.default
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupViews()
        setupScrollView()
        // -- Row Buttons
        setupChallengeButtons()
        setupFirstRow()
        setupSecondRow()
        setupThirdRow()
        setupFourthRow()
        // --
        setupAdvanceButton()
        setupCreateHabitButton()
        // -- Actions
        performActions()
    }
    
    fileprivate func setupController() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }
    
    fileprivate func performActions() {
        enableDayButtons()
        didTapToDismissKeyboard()
    }
    
    fileprivate func didTapToDismissKeyboard() {
        //Looks for single or multiple taps.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc fileprivate func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    fileprivate func enableDayButtons() {
        
        let dailyAction = UIAction(title: "Daily") { [weak self] _ in
            guard let self = self else { return }
            
            self.dayButtons.forEach { button in
                button.isEnabled = true
                button.isSelected = false
            }
            
            UIView.animate(withDuration: 0.4) {
                self.dayButtons.forEach { button in
                    button.backgroundColor = .systemGray6
                    button.setTitleColor(.black, for: .normal)
                    button.isEnabled = true
                }
            }
        }
        
        let weeklyAction = UIAction(title: "Weekly") { [weak self] _ in
            guard let self = self else { return }
            
            self.dayButtons.forEach { button in
                button.isEnabled = false
            }
            
            UIView.animate(withDuration: 0.4) {
                
                self.dayButtons.forEach { button in
                    button.backgroundColor = .systemGray
                    button.setTitleColor(.white, for: .normal)
                    button.isEnabled = false
                }
            }
        }
        
        frequencySegmentedControl.setAction(dailyAction, forSegmentAt: 0)
        frequencySegmentedControl.setAction(weeklyAction, forSegmentAt: 1)
    }
    
}

