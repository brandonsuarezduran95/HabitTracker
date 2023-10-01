//
//  HabitCreationViewController + setupFourthRow.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 8/10/23.
//

import UIKit

extension HabitCreationViewController {
    func setupFourthRow() {
        setupDaysFrequency()
        setupTimesPerDay()
    }
    
    fileprivate func setupDaysFrequency() {
        
        // Frequency
        frequencyLabel.text = "Frequency"
        frequencyLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        frequencyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            frequencyLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: Constants.verticalSpacing),
            frequencyLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: Constants.horizontalSpacing)
        ])
        
        // Segmented control
        let segmentedControlWidth: CGFloat = view.bounds.width - 40
        frequencySegmentedControl.selectedSegmentIndex = 0
        
        frequencySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            frequencySegmentedControl.topAnchor.constraint(equalTo: frequencyLabel.bottomAnchor, constant: Constants.verticalSpacing),
            frequencySegmentedControl.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: Constants.horizontalSpacing),
            frequencySegmentedControl.widthAnchor.constraint(equalToConstant: segmentedControlWidth),
            frequencySegmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.horizontalSpacing)
        ])
        
        // Day Buttons
        daysStackView.axis = .horizontal
        daysStackView.alignment = .center
        daysStackView.distribution = .equalCentering
        
        dayButtons.forEach { button in
            daysStackView.addArrangedSubview(button)
        }
        
        daysStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            daysStackView.topAnchor.constraint(equalTo: frequencySegmentedControl.bottomAnchor, constant: Constants.verticalSpacing * 2),
            daysStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.horizontalSpacing),
            daysStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.horizontalSpacing)
        ])
    }
    
    fileprivate func setupTimesPerDay() {
        // Label
        timesPerDayLabel.text = "Times per day"
        timesPerDayLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        timesPerDayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timesPerDayLabel.topAnchor.constraint(equalTo: daysStackView.bottomAnchor, constant: Constants.verticalSpacing),
            timesPerDayLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.horizontalSpacing),
            timesPerDayLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.horizontalSpacing)
        ])
        
        // TextView
        timesPerDayTextField.placeholder = "Number of times per day"
        timesPerDayTextField.font = .systemFont(ofSize: 16, weight: .light)
        timesPerDayTextField.keyboardType = .numberPad
        timesPerDayTextField.layer.borderWidth = 2
        timesPerDayTextField.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        timesPerDayTextField.backgroundColor = .clear
        timesPerDayTextField.layer.cornerRadius = 5
        timesPerDayTextField.textAlignment = .center
        timesPerDayTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        timesPerDayTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timesPerDayTextField.topAnchor.constraint(equalTo: timesPerDayLabel.bottomAnchor, constant: Constants.verticalSpacing),
            timesPerDayTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.horizontalSpacing),
            timesPerDayTextField.rightAnchor.constraint(equalTo: timesPerDayStepper.leftAnchor, constant: -Constants.horizontalSpacing),
            timesPerDayTextField.heightAnchor.constraint(equalToConstant: 34),
        ])
        
        // Stepper
        timesPerDayStepper.minimumValue = 0.0
        timesPerDayStepper.maximumValue = 99
        timesPerDayStepper.stepValue = 1.0
        timesPerDayStepper.addTarget(self, action: #selector(didTapStepper), for: .touchUpInside)
        
        timesPerDayStepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timesPerDayStepper.heightAnchor.constraint(equalToConstant: 34),
            timesPerDayStepper.topAnchor.constraint(equalTo: timesPerDayLabel.bottomAnchor, constant: Constants.verticalSpacing),
            timesPerDayStepper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.horizontalSpacing),
        ])
    }
    
    @objc fileprivate func textFieldDidChange(_ sender: UITextField) {
        
        let shakeAnimation = DispatchWorkItem { [weak self] in
            
            guard let self = self else { return }
            
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: (self.timesPerDayTextField.center.x - 3), y: self.timesPerDayTextField.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: (self.timesPerDayTextField.center.x + 3), y: self.timesPerDayTextField.center.y))

            self.timesPerDayTextField.layer.add(animation, forKey: "position")
            
        }
        
        if let textFieldText = timesPerDayTextField.text {
            if let value = Int(textFieldText) {
                if value == 0 {
                    timesPerDayTextField.text = "1"
                    shakeAnimation.perform()
                } else if value > 99 {
                    timesPerDayTextField.text = "99"
                    shakeAnimation.perform()
                }
            }
        }
        
        self.timesPerDayStepper.value = Double(timesPerDayTextField.text ?? "0.0") ?? 0.0
    }
    
    @objc fileprivate func didTapStepper( sender: UIStepper) {
        
        var stepperValue: Int = Int(timesPerDayStepper.value)
        
        if stepperValue == 0 {
            timesPerDayStepper.value = 1
            stepperValue = 1
        }
        
        timesPerDayTextField.text = "\(stepperValue)"
    }
    
    func makeDayOfWeekButton(title: String, tag: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        button.addTarget(self, action: #selector(didTapDayButton), for: .touchUpInside)
        button.tag = tag
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 30),
            button.heightAnchor.constraint(equalToConstant: 30),
        ])
        return button
    }
    
    @objc fileprivate func didTapDayButton(_ button: UIButton) {
        
        button.isSelected = !button.isSelected
        if button.isSelected {
            UIView.animate(withDuration: 0.4) { button.backgroundColor = .systemGray3 }
        } else  {
            UIView.animate(withDuration: 0.4) { button.backgroundColor = .systemGray6 }
        }
    }
}
