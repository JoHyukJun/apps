//
//  MenuoteApp.swift
//  Menuote
//
//  Created by johyukjun on 11/11/24.
//

import SwiftUI
import SwiftData


@main
struct MenuoteApp: App {
    var body: some Scene {
        MenuBarExtra {
            MainView()
                .modelContainer(for: MenuoteModel.self)
        } label: {
            Image("MenubarIcon")
        }
        .menuBarExtraStyle(.window)
    }
}
