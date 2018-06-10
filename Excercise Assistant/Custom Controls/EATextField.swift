//
//  EATextField.swift
//  Excercise Assistant
//
//  Created by Wayne Ohmer on 4/8/18.
//  Copyright © 2018 Wayne Ohmer. All rights reserved.
//

import UIKit

class EATextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    
    static var pickerStrings = ["hours","min","sec"]
    
    var storedTime = EATime() {
        didSet {
            self.text = storedTime.displaySting
            self.pickerView.selectRow(storedTime.hours, inComponent: 0, animated: true)
            self.pickerView.selectRow(storedTime.min, inComponent: 1, animated: true)
            self.pickerView.selectRow(storedTime.sec, inComponent: 2, animated: true)
        }
    }
    
    var maxTime = EATime(hours: 5, min: 61, sec: 61) {
        didSet {
            self.pickerView.selectRow(storedTime.hours, inComponent: 0, animated: true)
            self.pickerView.selectRow(storedTime.min, inComponent: 1, animated: true)
            self.pickerView.selectRow(storedTime.sec, inComponent: 2, animated: true)
        }
    }
    
    var title = ""
    @IBInspectable
    var isTime:Bool = false {
        didSet {
            if isTime {
                self.setUpTimePicker()
            }
        }
    }
    var pickerView = UIPickerView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addToolBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addToolBar()
    }
    
    func addToolBar() {
        let toolBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        let navItem = UINavigationItem()
        toolBar.barStyle = .black
        toolBar.barTintColor = UIColor.darkGray
        toolBar.tintColor = UIColor.white
        toolBar.isTranslucent = true
        
        navItem.title = self.title
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonTouched))
        navItem.leftBarButtonItem = doneButton
        let clearButton = UIBarButtonItem(title: "Clear", style: .done, target: self, action: #selector(self.clearButtonTouched))
        navItem.leftBarButtonItem = doneButton
        navItem.rightBarButtonItem = clearButton
        toolBar.items = [navItem]
        self.inputAccessoryView = toolBar
       
    }
    
    func setUpTimePicker() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.inputView = self.pickerView
    }
    
    @objc func doneButtonTouched() {
        self.resignFirstResponder()
    }
    
    @objc func clearButtonTouched() {
        self.text = ""
        if isTime {
            self.storedTime = EATime(hours: 0, min: 0, sec: 0 );
         }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0 :
            return self.maxTime.hours + 1
        case 1 :
            return (self.maxTime.hours > 0  && self.maxTime.hours > self.storedTime.hours) ? 61 : self.maxTime.min + 1
        case 2 :
            return self.maxTime.hours > 0 || self.maxTime.min > 0  ? 61 : self.maxTime.sec + 1
        default :
            return 61
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            self.storedTime.hours = row
        } else if component == 1 {
            self.storedTime.min = row
        } else if component == 2 {
            self.storedTime.sec = row
        }
        if self.storedTime > self.maxTime {
            self.storedTime = self.maxTime
        }
        self.text = self.storedTime.displaySting
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row) \(EATextField.pickerStrings[component])"
    }
}
