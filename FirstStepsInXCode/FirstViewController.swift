//
//  ViewController.swift
//  FirstStepsInXCode
//
//  Created by Mariam Joglidze on 21.10.23.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var DivisorsLbl: UILabel!
    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var switchState: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLbl.text = "result appear here"
    }
    
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            DivisorsLbl.text = "უსჯ"
            
        } else {
            DivisorsLbl.text = "უსგ"
        }
    }
    
    @IBAction func onCalculate(_ sender: Any) {
        if let firstNumberText = firstNumber.text, let secondNumberText = secondNumber.text {
            if let firstNumberInt = Int(firstNumberText), let secondNumberInt = Int(secondNumberText) {
                let switchState = switchState.isOn
                if switchState {
                    let result = lcm(firstNumberInt, secondNumberInt)
                    print("The least common multiple of \(firstNumberInt) and \(secondNumberInt) is \(result)")
                    resultLbl.text = String(result)
                } else {
                    let result = gcd(x: firstNumberInt, y: secondNumberInt)
                    print("The greatest common denominator of \(firstNumberInt) and \(secondNumberInt) is \(result)")
                    resultLbl.text = String(result)
                }
            } else {
                print("Invalid input. Please enter valid integers.")
            }
        } else {
            print("Missing input. Please enter both numbers.")
        }
    }
    
    
    func gcd(x: Int, y: Int) -> Int {
        var a = x
        var b = y
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        
        return abs(a)
    }
    
    func lcm(_ m: Int, _ n: Int) -> Int {
        return m*n / gcd(x: m, y: n)
    }
    
}
       

        

    


