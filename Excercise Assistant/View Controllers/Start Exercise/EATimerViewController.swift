//
//  EATimerViewController.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/8/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EATimerViewController: UIViewController {

    var time = EATime()
    var timer:Timer?

    @IBOutlet var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timerLabel.text = self.time.displaySting
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.timerChanged()
        })
    }
    func timerChanged() {
        if self.time.sec > 0 {
            self.time.sec -= 1
        } else {
            if self.time.min > 0 {
                self.time.min -= 1
                self.time.sec = 59
            }
        }
        self.timerLabel.text = self.time.displaySting
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
