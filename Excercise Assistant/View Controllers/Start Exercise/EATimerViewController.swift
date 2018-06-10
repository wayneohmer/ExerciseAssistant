//
//  EATimerViewController.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/8/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit
import AVFoundation


class EATimerViewController: UIViewController {

    var time = EATime()
    var exercise = EAExercise()
    var timer:Timer?
    var paused = false
    var pausedTime = EATime(hours: 0, min: 0, sec: 0)
    let speechSynthesizer = AVSpeechSynthesizer()

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var pausedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        UIApplication.shared.isIdleTimerDisabled = true
        self.exercise.time = self.time
        self.timerLabel.text = self.time.displaySting
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.timerChanged()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
        UIApplication.shared.isIdleTimerDisabled = false
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func timerChanged() {
        if self.paused {
            self.pausedTime.absoluteSec += 1
            self.pausedLabel.text = "Paused - \(self.pausedTime.displaySting)"
            return
        }
        if self.time.absoluteSec > 0 {
            self.time.absoluteSec -= 1
        } else {
            speechSynthesizer.speak(AVSpeechUtterance(string:"You sexy mother fucker"))
            self.navigationController?.popViewController(animated: true)
        }
        self.timerLabel.text = self.time.displaySting
        if self.exercise.spokenTimes.contains(self.time){
            if self.time.hours > 0 {
                if self.time.hours == 1 {
                    speechSynthesizer.speak(AVSpeechUtterance(string:"1 hour"))
                } else {
                    speechSynthesizer.speak(AVSpeechUtterance(string:"\(self.time.hours) hours"))
                }
            }
            if self.time.min > 0 {
                if self.time.min == 1 {
                    speechSynthesizer.speak(AVSpeechUtterance(string:"1 minute"))
                } else {
                    speechSynthesizer.speak(AVSpeechUtterance(string:"\(self.time.min) minutes"))
                }
            }
            if self.time.sec > 0 {
                speechSynthesizer.speak(AVSpeechUtterance(string:"\(self.time.sec)"))
            }
        }

    }
    
    @IBAction func timeTouched(_ sender: UITapGestureRecognizer) {
        self.paused = !self.paused
        self.pausedLabel.isHidden = !self.paused
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
