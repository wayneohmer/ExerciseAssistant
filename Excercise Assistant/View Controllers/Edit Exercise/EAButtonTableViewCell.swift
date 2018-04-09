//
//  EAButtonTableViewCell.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/8/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EAButtonTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.contentView.alpha = 0.3
            UIView.animate(withDuration: 0.3, animations: { self.contentView.alpha = 1.0 })
        } else {
            self.contentView.alpha = 1.0
        }
    }

}
