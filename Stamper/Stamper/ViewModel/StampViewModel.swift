//
//  StampViewModel.swift
//  Stamper
//
//  Created by johyukjun on 11/9/24.
//

import Foundation
import CoreData


final class StampViewModel: ObservableObject {
    @Published var stamp: Stamp
    let isNew: Bool
    
    let provider: StampProvider
    let context: NSManagedObjectContext
    
    init(provider: StampProvider, stamp: Stamp? = nil) {
        self.provider = provider
        self.context = provider.newContext
        
        // 현재 stamp 에 데이터가 있는 경우 edit 모드로 넘어 갈 수 있게 exist 불러오기
        if let stamp, let existStamp = provider.exist(stamp: stamp, context: context) {
            self.stamp = existStamp
            self.isNew = false
        }
        else {
            self.stamp = Stamp(context: self.context)
            self.isNew = true
        }
    }
    
    func viewModelSave() throws {
        // context 의 변화가 있을 경우 자기자신을 저장
        if context.hasChanges {
            try context.save()
        }
    }
}
