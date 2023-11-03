//
//  LayoutManager.swift
//  OCalc
//
//  Created by Kaneis Zontanos on 10/31/23.
//

import Foundation
import SwiftUI

struct LayoutManager {
    public func createLayout() -> some View {
        return VStack(spacing:20) {
            Text("NUM")
            
            QuarterLayout(["7", "8", "9"], "÷")
            QuarterLayout(["4", "5", "6"], "*")
            QuarterLayout(["1", "2", "3"], "-")
            QuarterLayout(["0", ".", "="], "+")
        }
    }
    
    private func QuarterLayout(_ nums: [String], _ op: String) -> some View {
        return HStack {
            ForEach(nums, id: \.self) { num in
                ButtonStylized(num)
            }
            ButtonStylized(op)
        }
    }
    
    private func ButtonStylized(_ val: String) -> some View {
        Button {
            
        } label: {
            Text(val)
                .font(.title)
                .frame(width: 90, height: 75)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(30)
        }
    }
}
