//
//  EAExerciseTableViewController.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/7/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EAExerciseTableViewController: UITableViewController {
    
    var isEdit = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EAExercise.sharedExercises.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EAExcerciseTableViewCell", for: indexPath) as! EAExcerciseTableViewCell

        cell.nameLabel.text = EAExercise.sharedExerciseArray[indexPath.row].0
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.isEdit {
            self.performSegue(withIdentifier: "edit", sender: EAExercise.sharedExerciseArray[indexPath.row].1)
        } else {
            self.performSegue(withIdentifier: "startExercise", sender: EAExercise.sharedExerciseArray[indexPath.row].1)

        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "edit" {
            guard let exercise = sender as? EAExercise else { return }
            guard let vc = segue.destination as? EAEditExerciseViewController else { return }
            vc.exercise = exercise
            vc.isNew = false
        } else if segue.identifier == "startExercise" {
            guard let exercise = sender as? EAExercise else { return }
            guard let vc = segue.destination as? EAStartExerciseViewController else { return }
            vc.exercise = exercise
        }
    }

}
