//
//  ViewController.swift
//  Calculator
//
//  Created by Alhric Lacle on 13/02/15.
//  Copyright (c) 2015 Alhric Lacle. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMIddleOfTpyingANumber = false
    

    @IBAction func appendDigit(sender: UIButton)
    {
        let digit = sender.currentTitle!
        if userIsInTheMIddleOfTpyingANumber
        {
        display.text = display.text! + digit
        }
        else
        {display.text = digit
        userIsInTheMIddleOfTpyingANumber = true}
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMIddleOfTpyingANumber {
            enter()
        }
        switch operation {
            case "×":
                if operandStack.count >= 2 {
            displayValue = operandStack.removeLast() * operandStack.removeLast()
                    enter()
            }
//            case "÷":
//            case "+":
//            case "-":
            default: break
        }
    }
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    var operandStack = Array<Double>()

    @IBAction func enter() {
        userIsInTheMIddleOfTpyingANumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
    
    var displayValue: Double {
        get{
        return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMIddleOfTpyingANumber = false
            }
    }
}

