//
//  EAStartExerciesTableViewController.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/7/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EAStartExerciesTableViewController: UITableViewController {

    var exercise = EAExercise()
    var logEntry = EALogEntry()
    
    @IBOutlet var timeCell: UITableViewCell!
    @IBOutlet var repsCell: UITableViewCell!
    @IBOutlet var weightCell: UITableViewCell!
    @IBOutlet var setsCell: UITableViewCell!
    
    @IBOutlet var timeField: EATextField!
    @IBOutlet var repsField: EATextField!
    @IBOutlet var weightField: EATextField!
    @IBOutlet var setsField: EATextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeCell.isHidden = !self.exercise.isTimed
        repsCell.isHidden = !self.exercise.hasReps
        weightCell.isHidden = !self.exercise.hasWeight
        setsCell.isHidden = !self.exercise.hasSets
        
        self.timeField.storedTime = self.exercise.time
        self.repsField.text = "\(self.exercise.reps)"
        self.weightField.text = "\(self.exercise.weight)"
        self.setsField.text = "\(self.exercise.sets)"

    }

    @IBAction func startTouched(_ sender: UIButton) {
        if sender.title(for: .normal) == "Start" {
            sender.setTitle("Finish", for: .normal)
            self.logEntry.start = Date()
            self.logEntry.exercise = self.exercise.getCopy() ?? EAExercise()
            if self.exercise.isTimed {
                self.parent?.performSegue(withIdentifier: "showTimer", sender: nil)
            }
            
        } else {
            self.logEntry.end = Date()
            self.logEntry.exercise.time = self.timeField.storedTime
            self.logEntry.exercise.reps = Int(self.repsField.text ?? "0") ?? 0
            self.logEntry.exercise.weight = Int(self.weightField.text ?? "0") ?? 0
            self.logEntry.exercise.sets = Int(self.setsField.text ?? "0") ?? 0
            EALog.sharedLog.entries.insert(self.logEntry, at: 0)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        return cell.isHidden ? 0 : 76
    }

}
