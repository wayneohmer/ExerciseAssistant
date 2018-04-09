//
//  EALogEntry.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/8/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EALogEntry: Encodable, Decodable {
    
    var start = Date()
    var end = Date()
    var exercise = EAExercise()

}
