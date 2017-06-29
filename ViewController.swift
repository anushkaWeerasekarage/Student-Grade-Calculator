//
//  ViewController.swift
//  StudentMarksApp
//
//  Created by Anushka Weerasekarage on 2017-06-28.
//  Copyright © 2017 Anushka Weerasekarage. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    @IBOutlet weak var idTextField: NSTextField!
    @IBOutlet weak var fName: NSTextField!
    @IBOutlet weak var lName: NSTextField!
    @IBOutlet weak var dataText: NSTextField!
    @IBOutlet weak var markField: NSTextField!
    @IBOutlet weak var aveLabel: NSTextField!
    @IBOutlet weak var gradeLabel: NSTextField!
    
    var idArray : [Int] = []
    var data : [String] = []
    var mArr : [String] = []
    var markArray : [Int] = []
    var id : String = ""
    var fn : String = ""
    var ln : String = ""
    var marks : String = ""
    var average : Int = 0
    var count : Int = 0
    var total : Int = 0
    var grade : String = ""

    //generate unique ID
    @IBAction func idGenerator(_ sender: Any) {
        
        var diceRoll = 0
        var duplicate : Bool = true
        
        repeat {
            diceRoll = Int(arc4random_uniform(UInt32(21) + 10))
            if(idArray.contains(diceRoll) == false) {
                idArray.append(diceRoll)
                duplicate = false
            }
        }while(duplicate)
        
        idTextField.stringValue = String(diceRoll)
    }
    
    //display data
    @IBAction func showData(_ sender: Any) {
    
        id = idTextField.stringValue
        fn = fName.stringValue
        ln = lName.stringValue
        
        data.append(id + ": " + fn + " " + ln)
        
        for item in data {
            
            dataText.stringValue = item
        }
        
    }
    
    //calculate average
    @IBAction func calAverage(_ sender: Any) {
        
        marks = markField.stringValue
        mArr = marks.components(separatedBy: ",")
        markArray = mArr.map({Int($0) ?? 0})
        //print(markArray)
        count = markArray.count
        total = markArray.reduce(0, {x, y in x + y})
        
        average = total / count
        aveLabel.stringValue = String(average)
        
    }
    
    //generate grade
    @IBAction func gradeFunc(_ sender: Any) {
        
        if(average > 97) {
            grade = "A+"
        }
        else if(average < 97 && average > 90) {
            grade = "A"
        }
        else if(average < 90 && average > 85) {
            grade = "A-"
        }
        else if(average < 85 && average > 80) {
            grade = "B+"
        }
        else if(average < 80 && average > 75) {
            grade = "B"
        }
        else if(average < 75 && average > 70) {
            grade = "B-"
        }
        else if(average < 70 && average > 65) {
            grade = "C+"
        }
        else if(average < 65 && average > 60) {
            grade = "C"
        }
        else if(average < 60 && average > 55) {
            grade = "C-"
        }
        else if(average < 55 && average > 50) {
            grade = "D"
        }
        else {
            grade = "F"
        }

        gradeLabel.stringValue = grade
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

