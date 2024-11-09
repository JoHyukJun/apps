//
//  StamperApp.swift
//  Stamper
//
//  Created by johyukjun on 11/8/24.
//

import SwiftUI

@main
struct StamperApp: App {
    @StateObject var vm: StampViewModel = .init(provider: StampProvider.shared)
    
    var body: some Scene {
        WindowGroup {
            MainView()
            // CoreData 를 SwitfUI 에 managedObjectContext 로 넘겨줘야 CoreData 를 가져옴
                .environment(\.managedObjectContext, StampProvider.shared.viewContext)
                .environmentObject(vm)
        }
    }
}
