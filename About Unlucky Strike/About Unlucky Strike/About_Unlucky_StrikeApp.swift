//
//  About_Unlucky_StrikeApp.swift
//  About Unlucky Strike
//
//  Created by johyukjun on 3/2/24.
//

import SwiftUI

@main
struct About_Unlucky_StrikeApp: App {
    @State var currentNumber: String = "1"
    var body: some Scene {
        //WindowGroup {
        //    ContentView()
        //}
        
        MenuBarExtra(currentNumber, systemImage: "\(currentNumber).circle") {
            Button("One") {
                currentNumber = "1"
            }
            .keyboardShortcut("1")
            Button("Two") {
                currentNumber = "2"
            }
            .keyboardShortcut("2")
            Button("Three") {
                currentNumber = "3"
            }
            .keyboardShortcut("3")
            
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
            .keyboardShortcut("q")
        }
    }
}
