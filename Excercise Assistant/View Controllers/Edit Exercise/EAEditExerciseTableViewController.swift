//
//  EAEditExerciseTableViewController.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/8/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EAEditExerciseTableViewController: UITableViewController {
    
    var isNew = true
    var exercise = EAExercise()

    @IBOutlet var timedSwitch: EAFieldSwitch!
    @IBOutlet var timeField: EATextField!
    
    @IBOutlet var repsSwitch: EAFieldSwitch!
    @IBOutlet var repsField: EATextField!
    
    @IBOutlet var weightSwitch: EAFieldSwitch!
    @IBOutlet var weightField: EATextField!
    
    @IBOutlet var setsSwitch: EAFieldSwitch!
    @IBOutlet var setsField: EATextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timeField.isTime = true
        self.timedSwitch.textField = self.timeField
        self.repsSwitch.textField = self.repsField
        self.weightSwitch.textField = self.weightField
        self.setsSwitch.textField = self.setsField
        
        if self.isNew {
            
            self.timedSwitch.isOn = false
            self.repsSwitch.isOn = false
            self.weightSwitch.isOn = false
            self.setsSwitch.isOn = false
            
            self.timeField.text = ""
            self.repsField.text = ""
            self.weightField.text = ""
            self.setsField.text = ""
            
        } else {
            self.timedSwitch.isOn = self.exercise.isTimed
            self.repsSwitch.isOn = self.exercise.hasReps
            self.weightSwitch.isOn = self.exercise.hasWeight
            self.setsSwitch.isOn = self.exercise.hasSets
            
            self.timeField.text = self.exercise.time.displaySting
            self.timeField.storedTime = self.exercise.time
            self.repsField.text = "\(self.exercise.reps)"
            self.weightField.text = "\(self.exercise.weight)"
            self.setsField.text = "\(self.exercise.sets)"
            
        }

    }
    
    @IBAction func switchChanged(_ sender: EAFieldSwitch) {
        
        guard let textField = sender.textField else { return }
        textField.isHidden = !sender.isOn
        if !textField.isHidden {
            textField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
    

}
