//
//  IntermediateApp.swift
//  Intermediate
//
//  Created by johyukjun on 10/30/24.
//

import SwiftUI
import SwiftData

@main
struct IntermediateApp: App {
//    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            IntroView()
            // Model Container 넘김 -> IntroView 에서 SampleModel 에 해당되는 SwiftData 를 넘김
                .modelContainer(for: SampleModel.self)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
