//
//  EAMainTableViewController.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/8/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EAMainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.tabBarController?.tabBar.tintColor = UIColor.black
        self.tabBarController?.tabBar.unselectedItemTintColor = UIColor.darkGray

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startExercise" {
            let vc = segue.destination as! EAExerciseTableViewController
            vc.isEdit = false
        }
    }

}
