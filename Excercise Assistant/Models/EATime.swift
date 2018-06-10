//
//  EAtime.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/8/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

struct EATime: Encodable, Decodable, Comparable, Hashable {
    
    var hours = Int(0)
    var min = Int(0)
    var sec = Int(0)
    
    var absoluteSec:Int {
        
        set {
            self.hours = newValue/3600
            let remaining = newValue%3600
            self.min = remaining/60
            self.sec = remaining%60
        }
        get {
            return (self.hours*3600) + (self.min*60) + self.sec
        }
    }

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
    
    var hashValue: Int {
        return absoluteSec
    }
    
    static func == (lhs: EATime, rhs: EATime) -> Bool {
        return lhs.absoluteSec == rhs.absoluteSec
    }
    
    static func < (lhs: EATime, rhs: EATime) -> Bool {
        return lhs.absoluteSec < rhs.absoluteSec
    }
    
}
