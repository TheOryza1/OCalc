//
//  ContentView.swift
//  OCalc
//
//  Created by Kaneis Zontanos on 10/31/23.
//

import SwiftUI

struct ContentView: View {
    var lytMgr: LayoutManager
    
    var body: some View {
        lytMgr.createLayout()
    }
}

#Preview {
    ContentView(lytMgr: LayoutManager())
}
