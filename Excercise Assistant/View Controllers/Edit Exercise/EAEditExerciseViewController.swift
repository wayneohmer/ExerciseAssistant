//
//  EAEditExerciseViewController.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/7/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EAEditExerciseViewController: UIViewController {

    var isNew = true
    var exercise = EAExercise()
    
    var embededViewController = EAEditExerciseTableViewController()
    
    @IBOutlet var nameField: UITextField!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        if !isNew {
            self.nameField.text = self.exercise.name
        }
        // Do any additional setup after loading the view.
    }

   
    
    @IBAction func saveTouched(_ sender: UIBarButtonItem) {
        
        if let key = self.nameField.text {
            if !self.isNew && self.exercise.name != key {
                let alert = UIAlertController(title: "You've changed the name", message: "Replace existing or create new and keeep old.", preferredStyle: .alert)
                let replaceAction = UIAlertAction(title: "Replace", style: .default) { action in
                    EAExercise.sharedExercises.removeValue(forKey: self.exercise.name)
                    self.exercise.name = key
                    self.updateExercise()
                    EAExercise.sharedExercises[key] = self.exercise
                    self.navigationController?.popViewController(animated: true)
                }
                let addAction = UIAlertAction(title: "Add", style: .default) { action in
                    self.exercise = EAExercise()
                    self.exercise.name = key
                    self.updateExercise()
                    EAExercise.sharedExercises[key] = self.exercise
                    self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(replaceAction)
                alert.addAction(addAction)
                self.present(alert, animated: true, completion: nil)
                
            } else {
                self.exercise.name = key
                self.updateExercise()

                EAExercise.sharedExercises[key] = self.exercise
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func deleteTouched(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Are You Sure?", message: "", preferredStyle: .alert)
        let removeAction = UIAlertAction(title: "Delete", style: .destructive) { action in
            EAExercise.sharedExercises.removeValue(forKey: self.exercise.name)
            self.navigationController?.popViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(removeAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateExercise() {
        self.exercise.isTimed = embededViewController.timedSwitch.isOn
        self.exercise.hasReps = embededViewController.repsSwitch.isOn
        self.exercise.hasWeight = embededViewController.weightSwitch.isOn
        self.exercise.hasSets = embededViewController.setsSwitch.isOn
        
        self.exercise.time = embededViewController.timeField.storedTime
        self.exercise.reps = Int(embededViewController.repsField.text ?? "0") ?? 0
        self.exercise.weight = Int(embededViewController.weightField.text ?? "0") ?? 0
        self.exercise.sets = Int(embededViewController.setsField.text ?? "0") ?? 0
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embed" {
            self.embededViewController = segue.destination as! EAEditExerciseTableViewController
            self.embededViewController.exercise = self.exercise
            self.embededViewController.isNew = self.isNew
        }
    }
}
