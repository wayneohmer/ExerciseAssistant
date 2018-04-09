//
//  EAFieldSwitch.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/7/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EAFieldSwitch: UISwitch {

    var textField:UITextField?
    
    override var isOn: Bool {
        didSet {
            self.textField?.isHidden = !super.isOn
        }
    }
    
    

}
