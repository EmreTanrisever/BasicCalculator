//
//  ViewController.swift
//  Calculator-V2
//
//  Created by Emre Tanrısever on 31.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    
    let keyPad = [
        0: "0", 1: "=",
        2: "1", 3: "2", 4: "3", 5: "+",
        6: "4", 7: "5", 8: "6", 9: "-",
        10: "7", 11: "8", 12: "9", 13: "*",
        14: "C", 15: "/"
    ]
    
    var firstNumber: Int!
    var secondNumber: Int!
    var currentOperation: Operation!
    
    enum Operation {
        case add, subtract, multiply, divide
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text! = "0"
    }
    
    @IBAction func buttonsTapped(_ sender: UIButton!) {
        let tag = sender.tag
        if tag != 1 && tag != 5 && tag != 9 && tag != 13 && tag != 14 && tag != 15 {
            if resultLabel.text != "0" {
                resultLabel.text! += String(keyPad[tag] ?? "")
            } else {
                resultLabel.text = String(keyPad[tag] ?? "")
            }
        } else if tag == 1 && resultLabel.text != "0" && firstNumber != nil {
            secondNumber = Int(resultLabel.text!)
            switch currentOperation {
            case .add:
                resultLabel.text = "\(firstNumber + secondNumber)"
            case .subtract:
                resultLabel.text = "\(firstNumber - secondNumber)"
            case .multiply:
                resultLabel.text = "\(firstNumber * secondNumber)"
            case .divide:
                resultLabel.text = "\(firstNumber / secondNumber)"
            default :
                print("Error")
            }
        } else if currentOperation == nil {
            if tag == 5 {
                currentOperation = .add
            } else if tag == 9 {
                currentOperation = .subtract
            } else if tag == 13 {
                currentOperation = .multiply
            } else if tag == 15 {
                currentOperation = .divide
            }
            firstNumber = Int(resultLabel.text!)
            resultLabel.text = "0"
        } else {
            firstNumber = nil
            secondNumber = nil
            currentOperation = nil
            resultLabel.text = "0"
        }
    }


}

