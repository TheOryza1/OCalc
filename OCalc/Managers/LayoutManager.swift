//
//  LayoutManager.swift
//  OCalc
//
//  Created by Kaneis Zontanos on 10/31/23.
//

import Foundation
import SwiftUI

class LayoutManager: ObservableObject {
    private var lgcMgr = LogicManager()
    @Published var display = ""
    
    public func createLayout() -> some View {
        return VStack(spacing:20) {
            Text(self.display)
                .font(.title)
                .onChange(of: self.display) {
                    self.display = self.lgcMgr.handleInput(self.display)
                }
            
            QuarterLayout(["7", "8", "9"], "÷")
            QuarterLayout(["4", "5", "6"], "×")
            QuarterLayout(["1", "2", "3"], "-")
            QuarterLayout(["0", ".", "="], "+")
        }
    }
    
    private func QuarterLayout(_ nums: [String], _ op: String) -> some View {
        return HStack {
            ForEach(nums, id: \.self) { num in
                self.ButtonStylized(num, isDisabled: false)
            }
            self.ButtonStylized(op, isDisabled: false)
        }
    }
    
    private func ButtonStylized(_ val: String, isDisabled: Bool) -> some View {
        Button {
            self.display += val
        } label: {
            Text(val)
                .font(.system(size: 50))
                .frame(width: 90, height: 75)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(.infinity)
        }
        .disabled(isDisabled)
    }
}
