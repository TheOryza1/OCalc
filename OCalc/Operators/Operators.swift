//
//  Operators.swift
//  OCalc
//
//  Created by Kaneis Zontanos on 10/31/23.
//

import Foundation

struct Operators {
    private func valToReturn(result: Double) -> Number {
        if floor(result) == result {
            return .integer(Int(result))
        } else {return .double(Double(result))}
    }
    
    func Add(_ num1: Number, _ num2: Number) -> Number? {
        if let val1 = num1.valDouble, let val2 = num2.valDouble {
            return valToReturn(result: val1 + val2)
        }
        return Number("ERROR")
    }
    
    func Subtract(_ num1: Number, _ num2: Number) -> Number? {
        if let val1 = num1.valDouble, let val2 = num2.valDouble {
            return valToReturn(result: val1 - val2)
        }
        return Number("ERROR")
    }

    func Multiply(_ num1: Number, _ num2: Number) -> Number? {
        if let val1 = num1.valDouble, let val2 = num2.valDouble {
            return valToReturn(result: val1 * val2)
        }
        return Number("ERROR")
    }

    func Divide(_ num1: Number, _ num2: Number) -> Number? {
        guard num2.valDouble != 0 else {return Number("ERROR")}
        
        if let val1 = num1.valDouble, let val2 = num2.valDouble {
            return valToReturn(result: val1 / val2)
        }
        return Number("ERROR")
    }

}
