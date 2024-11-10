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
    
    func delete(stamp: Stamp, context: NSManagedObjectContext) throws {
        // 현재 Stamp 가 있는지 확인
        if let existingStamp = self.exist(stamp: stamp, context: context) {
            // 선택된 context 를 CoreData 에서 삭제
            context.delete(existingStamp)
            
            // 삭제 한 다음 저장 -> 비동기 처리를 위해 Task 사용 (background 상태에서 작업할 수 있게 함)
            Task(priority: .background) {
                try await context.perform {
                    try context.save()
                }
            }
        }
    }
}
