//
//  Stamp.swift
//  Stamper
//
//  Created by johyukjun on 11/9/24.
//

import Foundation
import CoreData


final class Stamp: NSManagedObject, Identifiable {
    @NSManaged var name: String
    @NSManaged var company: String
    @NSManaged var isFav: Bool
    @NSManaged var notes: String
    @NSManaged var totalFreeCoffee: Int
    @NSManaged var selectedCoffee: Int
    
    // 값이 있을 경우 저장 안되게 save 를 disable 하기위한 compute property
    var isValid: Bool {
        !name.isEmpty && !company.isEmpty
    }
}

extension Stamp {
    private static var stampFetchRequest: NSFetchRequest<Stamp> {
        NSFetchRequest(entityName: "Stamp")
    }
    
    // all() 함수를 request 를 sort 해서 array 로 return
    static func all() -> NSFetchRequest<Stamp> {
        let request: NSFetchRequest<Stamp> = stampFetchRequest
        
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Stamp.name, ascending: true)
        ]
        
        return request
    }
}
