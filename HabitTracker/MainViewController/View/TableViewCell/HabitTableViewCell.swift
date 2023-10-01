//
//  HabitTableViewCell.swift
//  HabitTracker
//
//  Created by Brandon Suarez on 9/29/23.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    
    // UI Elements
    let titleLabel: UILabel = UILabel()
    let descriptionLabel: UILabel = UILabel()
    let countLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemRed
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
