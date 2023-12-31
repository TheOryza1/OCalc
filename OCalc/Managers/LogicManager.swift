//
//  LogicManager.swift
//  OCalc
//
//  Created by Kaneis Zontanos on 11/4/23.
//

import Foundation

class LogicManager: ObservableObject {
    private var opMgr = Operators()
    private var firstNum: Number?
    private var secondNum: Number?
    private var isFirst: Bool = true
    private var dotCounter = 0
    private var op: String?
        
    func handleInput(_ displayString: String) -> String {
        let operators = ["+", "-", "×", "÷", "="]
        if let last = displayString.last {
            if operators.contains(String(last)) {
                if String(last) != "=" {op = String(last)}
                
                if isFirst {
                    firstNum = assignVal(displayString)
                    isFirst = false
                    dotCounter = 0
                } else {
                    if String(last) == "="{
                        return equalsOperator(displayString)
                    }
                }

                return ""
            } 
        }
        return displayString
    }

    func handleButtons(_ displayString: String, _ valString: String) -> String {
        if(valString == "." && displayString.contains(".")) {return displayString}
        return (displayString + valString)
    }
    
    //Takes string as input, converts to Number enum, returns number if works otherwise Number(0)
    private func assignVal(_ str: String) -> Number {
        var toReturn = Number(0)

        if let num = Int(str.dropLast()) {
            toReturn = Number(num)
        } else if let num = Double(str.dropLast()) {
            toReturn = Number(num)
        }
        return toReturn
    }
    
    //Takes in the display string and calculates based off the op, returns ERROR msg if something goes wrong
    private func equalsOperator(_ displayString: String) -> String {
        secondNum = assignVal(displayString)
        isFirst = true
        
        if let num1 = firstNum {
            if let num2 = secondNum {
                dotCounter = 0
                if let result = opType(op!, num1, num2).valDouble {
                    if floor(result) == result {
                        return String(Int(result))
                    }
                    return String(result)
                }
            }
        }
        return "ERROR"
    }
    
    //Takes in op, num1, num2, based off the op, it will use the correct operator for the two nums
    private func opType(_ op: String, _ num1: Number, _ num2: Number) -> Number {
        switch op {
        case "+": return opMgr.Add(num1, num2)!
        case "-": return opMgr.Subtract(num1, num2)!
        case "×": return opMgr.Multiply(num1, num2)!
        case "÷": return opMgr.Divide(num1, num2)!
        default: return Number("ERROR")
        }
    }
    
}
