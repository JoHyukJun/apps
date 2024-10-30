//
//  BasicApp.swift
//  Basic
//
//  Created by johyukjun on 8/3/24.
//

import SwiftUI

@main
struct BasicApp: App {
    // ASIS ViewModel Enviroment transportation
    @StateObject private var vm1 = UserObservableObject()
    
    // @Observation
    @State private var vm2 = UserObservableMacro()
    
    var body: some Scene {
        WindowGroup {
            ObservationBasic()
                .environmentObject(vm1) // ASIS EnviromentObject transportation
                .environment(vm2) // @Observation
        }
    }
}
