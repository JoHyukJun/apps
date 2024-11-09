//
//  StampProvider.swift
//  Stamper
//
//  Created by johyukjun on 11/9/24.
//

import Foundation
import CoreData


class StampProvider {
    // singleton instance declare
    static let shared = StampProvider()
    
    // container
    private let container: NSPersistentContainer

    var viewContext: NSManagedObjectContext {
        container.viewContext
    }
    
    private init() {
        container = NSPersistentContainer(name: "Stamp")
        
        // ViewContext 변화 될 때 자동으로 기존 데이터에 merge 시켜서 자동 업데이트 시켜줌
//        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to load persistent stores: \(error)")
            }
            else {
                print("StampProvider loaded successfully.")
            }
        }
    }
}
