//
//  EAExercise.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/7/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EAExercise: Encodable, Decodable {
    
    var name = ""
    var isTimed = false
    var time = EATime(hours: 0,min: 0,sec: 0)
    var hasReps = false
    var reps = Int(0)
    var hasWeight = false
    var weight = Int(0)
    var hasSets = false
    var sets = Int(0)
    
    static var sharedExerciseArray = [(String,EAExercise)]()
    
    static var sharedExercises:[String:EAExercise] = [String:EAExercise]() {
        didSet {
            EAExercise.sharedExerciseArray = EAExercise.sharedExercises.sorted(by: {$0.key < $1.key })
            UserDefaults.standard.set(EAExercise.encodedData(), forKey:"exerciseData")
        }
    }
    
    func getCopy() -> EAExercise? {
        if let data = try? JSONEncoder().encode(self) {
            return try? JSONDecoder().decode(EAExercise.self, from: data)
        }
        return nil
    }
    
    class func encodedData() -> [String:Data] {
        var returnArray = [String:Data]()
        for (key,exercise) in EAExercise.sharedExercises {
            if let data = try? JSONEncoder().encode(exercise) {
                returnArray[key] = data
            }
        }
        return returnArray
    }
    
    class func decodeData(data:Data) -> EAExercise? {
        
        return try? JSONDecoder().decode(EAExercise.self, from: data)

    }

}
