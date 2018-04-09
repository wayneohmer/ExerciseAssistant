//
//  EALog.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/8/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EALog: Encodable, Decodable {
    
    var entries = [EALogEntry]() {
        didSet {
            if let data = try? JSONEncoder().encode(EALog.sharedLog) {
                UserDefaults.standard.set(data, forKey:"exerciseLog")
            }
        }
    }
    
    static var sharedLog = EALog()
}
