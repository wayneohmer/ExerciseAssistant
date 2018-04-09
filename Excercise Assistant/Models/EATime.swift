//
//  EAtime.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/8/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

struct EATime: Encodable, Decodable  {
    
    var hours = Int(0)
    var min = Int(0)
    var sec = Int(0)

    var displaySting:String  {
        get {
            if hours > 0 {
                return String(format:"%d:%02d:%02d",hours,min,sec)
            } else if min  > 0 {
                return String(format:"%d:%02d",min,sec)
            } else {
                return sec > 0 ? "\(sec)" : ""
            }
        }
    }
    
}
