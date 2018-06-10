//
//  EAEditExerciseTableViewController.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/8/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EAEditExerciseTableViewController: UITableViewController, UITextFieldDelegate {
    
    var isNew = true
    var exercise = EAExercise()

    @IBOutlet var speakTimesCell: UITableViewCell!
    @IBOutlet var speakEveryCell: UITableViewCell!
    
    @IBOutlet var timedSwitch: EAFieldSwitch!
    @IBOutlet var timeField: EATextField!
    @IBOutlet var speakEveryField: EATextField!
    
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
            self.speakEveryField.text = ""
            self.repsField.text = ""
            self.weightField.text = ""
            self.setsField.text = ""
            
        } else {
            self.timedSwitch.isOn = self.exercise.isTimed
            self.repsSwitch.isOn = self.exercise.hasReps
            self.weightSwitch.isOn = self.exercise.hasWeight
            self.setsSwitch.isOn = self.exercise.hasSets
            
            self.timeField.text = self.exercise.time.displaySting
            self.speakEveryField.text = self.exercise.speakEvery.displaySting
            self.timeField.storedTime = self.exercise.time
            self.speakEveryField.storedTime = self.exercise.speakEvery
            self.speakEveryField.maxTime = self.exercise.time

            self.repsField.text = "\(self.exercise.reps)"
            self.weightField.text = "\(self.exercise.weight)"
            self.setsField.text = "\(self.exercise.sets)"
            
            self.speakEveryCell.isHidden = !self.timedSwitch.isOn
            self.speakTimesCell.isHidden = !self.timedSwitch.isOn

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
        if sender == self.timedSwitch {
            self.speakEveryCell.isHidden = !self.timedSwitch.isOn
            self.speakTimesCell.isHidden = !self.timedSwitch.isOn
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.timeField {
            self.speakEveryField.maxTime = self.timeField.storedTime
        }
    }
    
    @IBAction func speakTimesToched() {
        if let vc = self.parent as? EAEditExerciseViewController {
            vc.performSegue(withIdentifier: "SpeakTimes", sender: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        return cell.isHidden ? 0 : 80
    }


}
