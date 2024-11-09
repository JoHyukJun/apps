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
    
    // Add Stamp context 추가하는 computed property
    var newContext: NSManagedObjectContext {
        // NSManagedObject 가 main thread 에서 작동할 수 있게 설정
        // View 에 나타내는 것이기때문에 main thread 에서 해줘야 error 안생김
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        // 설정한 값을 container storecoordinator  에 작동하게 함
        context.persistentStoreCoordinator = container.persistentStoreCoordinator
        
        return context
    }
    
    private init() {
        container = NSPersistentContainer(name: "StampDataModel")
        
        // ViewContext 변화 될 때 자동으로 기존 데이터에 merge 시켜서 자동 업데이트 시켜줌
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to load persistent stores: \(error)")
            }
            else {
                print("StampProvider loaded successfully.")
            }
        }
    }
    
    // Stamp CoreData 에 저장되어 있는지 확인
    func exist(stamp: Stamp, context: NSManagedObjectContext) -> Stamp? {
        try? context.existingObject(with: stamp.objectID) as? Stamp
    }
}
