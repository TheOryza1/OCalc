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
    @Published var history: [String] = []
    @Published var display = ""
    @State private var selectedHistory = ""
    
    
    public func createLayout() -> some View {
        return ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1), Color.purple.opacity(0.9)]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:15) {
                HStack {
                    Text(self.display)
                        .font(.custom("Menlo", size: 50))
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(10)
                        .onChange(of: self.display) {
                            self.display = self.lgcMgr.handleInput(self.display)
                        }
                }
                
                QuarterLayout(["7", "8", "9"], "÷")
                QuarterLayout(["4", "5", "6"], "×")
                QuarterLayout(["1", "2", "3"], "-")
                QuarterLayout(["0", ".", "="], "+")
                
            }
            .padding()
        }
    }
    
    private func QuarterLayout(_ nums: [String], _ op: String) -> some View {
        return HStack {
            ForEach(nums, id: \.self) { num in
                self.ButtonStylized(num)
            }
            self.ButtonStylized(op)
        }
    }
    
    private func ButtonStylized(_ val: String) -> some View {
        return Button {
            self.display = self.lgcMgr.handleButtons(self.display, val)
        } label: {
            Text(val)
                .font(.system(size: 28))
                .frame(width: 80, height: 65)
                .background(Color.black.opacity(0.65))
                .foregroundColor(.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 2)
        }
    }
        
    private func HistoryWheel() -> some View {
        print(selectedHistory)
        return Picker("History", selection: $selectedHistory) {
            ForEach(history, id: \.self) {
                Text($0)
                    .font(.system(size: 28))
                    .frame(width: 80, height: 65)
                    .background(Color.black.opacity(0.65))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 2)

            }
        }
    }

}
