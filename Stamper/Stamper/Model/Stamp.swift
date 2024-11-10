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
    
    // blank 상태의 CoreData 추가
    static func empty(context: NSManagedObjectContext = StampProvider.shared.viewContext) -> Stamp {
        return Stamp(context: context)
    }
    
    static func favFilter(config: FavConfig) -> NSPredicate {
        switch config.filter {
        case .all:
            // value true -> 모든 값 출력
            return NSPredicate(value: true)
        case .fav:
            // %@ 은 검색할 값을 전달할때 사용
            // CoreData 에서 isFav 가 true 인것만 검색하도록 전달
            // %@ 을 사용해 값 형식을 대체해야할 때에는 NSNumbㄷㄱ 를 사용해서 value 값을 전달
            return NSPredicate(format: "isFav == %@", NSNumber(value: true))
        }
    }
}

struct FavConfig: Equatable {
    enum Filter {
        case all, fav
    }
    
    var filter: Filter = .all
}
