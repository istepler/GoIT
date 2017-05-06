//
//  ViewController.swift
//  Calculator_Start
//
//  Created by Kirill Kirikov on 4/22/17.
//  Copyright © 2017 GoIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputLabel: UILabel!
    
    var model = CalculatorModel()
    var inputStarted = false
    var dotUsed = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func input(_ sender: UIButton) {
        
        if (!inputStarted) {
            inputLabel.text = ""
        }
        
        inputStarted = true
        
        // ЗАДАНИЕ 2 ----------------------------------------------------------------------------
        if inputLabel.text?.characters.count == 1 {
            if inputLabel.text == "0" {
                inputLabel.text = "\(sender.title(for: .normal)!)"
            } else {
                inputLabel.text = "\(inputLabel.text!)\(sender.title(for: .normal)!)"
            }
        } else {
            inputLabel.text = "\(inputLabel.text!)\(sender.title(for: .normal)!)"
        }
    }
    // ЗАДАНИЕ 3 ---------------------------------------------------------------------------------
    @IBAction func putDot(_ sender: Any) {
        if !inputStarted //inputLabel.text == "0" {
        {
            inputLabel.text = "0."
            inputStarted = true
            dotUsed = true
        }
        if inputStarted {
            if !(dotUsed) {
                inputLabel.text = "\(inputLabel.text!)" + "."
                dotUsed = true
            }
        }
    }
    
    @IBAction func evaluate(_ sender: UIButton) {
        
        let result = model.evaluate(operand: inputToDigit())
        inputLabel.text = "\(result)"
        inputStarted = false
        dotUsed = false
    }
    
    @IBAction func operation(_ sender: UIButton) {
        
        if let operation = sender.title(for: .normal) {
            let result = model.operation(operand: inputToDigit(), operation: operation)
            inputLabel.text = "\(result)"
            inputStarted = false
            dotUsed = false
        }
    }
    
    // ЗАДАНИЕ 4 ----------------------------------------------------------------------------------
    @IBAction func reset(_ sender: UIButton) {
        model.reset()
        inputStarted = false
        dotUsed = false
        inputLabel.text = "0"
    }
    
    
    func inputToDigit() -> Double? {
        
        if !inputStarted {
            return nil
        }
        
        guard let input = inputLabel.text else {
            return 0
        }
        
        return Double(input) ?? 0
    }
    
}

