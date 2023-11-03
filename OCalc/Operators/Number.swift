//
//  Number.swift
//  OCalc
//
//  Created by Kaneis Zontanos on 10/31/23.
//

import Foundation

enum Number {
    case integer(Int)
    case double(Double)
    
    init(_ val: Int) {self = .integer(val)}
    init(_ val: Double) {self = .double(val)}
    
    var valDouble: Double {
        switch self {
            case .integer(let val):
                return Double(val)
            case .double(let val):
                return val
        }
    }
    
    var valInt: Int {
        switch self {
            case .integer(let val):
                return val
            case .double(let val):
                return Int(val)
        }
    }
}
