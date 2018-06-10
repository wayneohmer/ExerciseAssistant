//
//  EALogTableViewController.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/8/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EALogTableViewController: UITableViewController {

    var tableData = [[EALogEntry]]()
    var flatIndexs = [IndexPath]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.makeTableData()
    }

    func makeTableData() {
        
        self.tableData.removeAll()
        var dayArray = [EALogEntry]()

//        let calendar = Calendar.current
//        var previousEntry = EALogEntry()
        for logEntry in EALog.sharedLog.entries {
//           if dayArray.count != 0 {
//                let previousDay = calendar.component(.day, from: previousEntry.start)
//                let thisDay = calendar.component(.day, from: logEntry.start)
//                if previousDay != thisDay {
//                    let previousMidnight = calendar.startOfDay(for: previousEntry.start)
//                    let logEntryMidnight = calendar.startOfDay(for: logEntry.start)
//                    let difference = calendar.dateComponents([.day], from: logEntryMidnight, to: previousMidnight)
//                    if let days = difference.day {
//                        if days > 1 {
//                            dayArray.append(P9SlogEntry(date: logEntry.date, exersises: "\(days - 1) Day Gap", note: "", isGap: true))
//                        }
//                    }
//                    self.tableData.append(dayArray)
//                    dayArray.removeAll()
//                }
//            }
//            previousEntry = logEntry
            dayArray.append(logEntry)

        }
        self.tableData.append(dayArray)
        self.flatIndexs.removeAll()
        for (section, _) in self.tableData.enumerated()  {
            for (row, _) in self.tableData[section].enumerated() {
                self.flatIndexs.append(IndexPath(row: row, section: section))
            }
        }
        self.tableView.reloadData()
    }

   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData[section].count
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textAlignment = .center
            headerView.textLabel?.textColor = UIColor.white
            headerView.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            headerView.contentView.backgroundColor = UIColor.darkGray
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.tableData[section].count > 0 {
            return "\(self.tableData[section][0].start.formattedLongDate())"
        } else {
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EALogEntryCell", for: indexPath) as! EALogEntryCell

        let logentry = self.tableData[indexPath.section][indexPath.row]
        cell.exerciseLabel.text = logentry.exercise.name
        cell.startLabel.text = logentry.start.formattedTime()
        cell.endLabel.text = logentry.end.formattedTime()

        return cell
    }

  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
