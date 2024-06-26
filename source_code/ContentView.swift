//
//  ContentView.swift
//  teste
//
//  Created by Caio Melloni dos Santos on 25/03/24.
//

import BackendLib
import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var cycleService: CycleService

    init(context: ModelContext) {
        let cycleService = CycleService(context: context)
        _cycleService = State(initialValue: cycleService)
    }

    var body: some View {
        let cycle = cycleService.createCycle()
        SelectedFrame(cycle: cycle, selectionType: .symptons, date: Date())
        SelectedFrame(cycle: cycle, selectionType: .mood, date: Date())
    }
}
