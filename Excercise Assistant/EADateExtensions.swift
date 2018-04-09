//
//  EADateExtensions.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/8/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

extension Date {
    
    
    func formattedLongDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE MMM dd yyyy"
        return dateFormatter.string(from: self)
    }
    
    func formattedTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss a"
        return dateFormatter.string(from: self)
    }

}
