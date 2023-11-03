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
        let result = num1.valDouble + num2.valDouble
        return valToReturn(result: result)
    }
    
    func Subtract(_ num1: Number, _ num2: Number) -> Number? {
        let result = num1.valDouble - num2.valDouble
        return valToReturn(result: result)
    }

    func Multiply(_ num1: Number, _ num2: Number) -> Number? {
        let result = num1.valDouble * num2.valDouble
        return valToReturn(result: result)
    }

    func Divide(_ num1: Number, _ num2: Number) -> Number? {
        guard num2.valDouble != 0 else {return nil}
        
        let result = num1.valDouble / num2.valDouble
        return valToReturn(result: result)
    }

}
