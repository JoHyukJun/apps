//
//  SampleModel.swift
//  Intermediate
//
//  Created by johyukjun on 11/10/24.
//

import Foundation
import SwiftData


// SwiftData 에 영구적으로 저장할 수 있는 name type 을 선언하는 매크로
@Model
class SampleModel {
    var name: String
    var age: Int
    
    // class 를 사용하기 때문에 init 값 설정
    init(name: String = "", age: Int = 0) {
        self.name = name
        self.age = age
    }
}
