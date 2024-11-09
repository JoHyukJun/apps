//
//  IntermediateApp.swift
//  Intermediate
//
//  Created by johyukjun on 10/30/24.
//

import SwiftUI
import CoreData

@main
struct IntermediateApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            CoreDataInter()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
