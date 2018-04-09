//
//  EAStartExerciseViewController.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/7/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EAStartExerciseViewController: UIViewController {

    var exercise = EAExercise()
    var embededVC = EAStartExerciesTableViewController()
    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = self.exercise.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailTable" {
            self.embededVC = segue.destination as! EAStartExerciesTableViewController
            self.embededVC.exercise = self.exercise
        } else if segue.identifier == "showTimer" {
            let vc = segue.destination as! EATimerViewController
            vc.time = self.embededVC.timeField.storedTime
        }
    }

}
