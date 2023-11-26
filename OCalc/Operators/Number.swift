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
    case error(String)
    
    init(_ val: Int) {self = .integer(val)}
    init(_ val: Double) {self = .double(val)}
    init(_ val: String) {self = .error(val)}
    
    var valDouble: Double? {
        switch self {
            case .integer(let val):
                return Double(val)
            case .double(let val):
                return val
            case .error(_):
                return nil
        }
    }
    
    var valInt: Int? {
        switch self {
            case .integer(let val):
                return val
            case .double(let val):
                return Int(val)
            case .error(_):
                return nil
        }
    }
}
