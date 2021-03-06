//
//  EmergencyContactCell.swift
//  help-fall-app
//
//  Created by Guillian Balisi on 2016-01-16.
//  Copyright © 2016 Simon Quach. All rights reserved.
//

import UIKit

class EmergencyContactCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var numberLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(name: String, number: String) {
        nameLabel!.text = name
        numberLabel!.text = number
    }
}
