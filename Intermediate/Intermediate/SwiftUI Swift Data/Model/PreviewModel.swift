//
//  PreviewModel.swift
//  Intermediate
//
//  Created by johyukjun on 11/10/24.
//

import Foundation
import SwiftData


// SwiftData 에 영구적으로 저장할 수 있는 name type 을 선언하는 매크로
@Model
class PreviewModel {
    var name: String
    var age: Int
    
    // class 를 사용하기 때문에 init 값 설정
    init(name: String = "", age: Int = 0) {
        self.name = name
        self.age = age
    }
}

// Preview 에서 사용할 수 있는 Mock data 생성
// Manual
extension PreviewModel {
    // @MainActor 는 아래의 코드가 main thread 에서 실행하도록 보장
    @MainActor
    static var previewData: ModelContainer {
        let container: ModelContainer
        
        // isStoredInMemoryOnly 경우는 Preview 에서만 사용하므로 mock data 를 영구적으로 저장하지 않고 ram 에 임시 저장
        do {
            try container = ModelContainer(for: PreviewModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        } catch {
            fatalError("FATAL ERROR: \(error)")
        }
        
        // Create Data
        let names = ["derek", "karma", "police"]
        let ages = [10, 30, 23]
        
        for _ in 0..<5 {
            let name = names.randomElement() ?? ""
            let age = ages.randomElement() ?? 0
            
            let person = PreviewModel(name: name, age: age)
        
            // Insert to SwfitData
            // UI 관련된 데이터는 main thread 에서 관리
            container.mainContext.insert(person)
        }
        
        return container
    }
}
