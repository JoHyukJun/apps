//
//  UserViewModel.swift
//  Basic
//
//  Created by johyukjun on 10/30/24.
//

import Foundation
import Observation


// MARK: - ASIS
class UserObservableObject: ObservableObject {
    let name: String = "vm1"
    
    @Published var number: Int = 0
    @Published var isClick: Bool = false
}


// MARK: - @Observable
@Observable
class UserObservableMacro {
    let name: String = "vm2"
    var number: Int = 0
    var isClick: Bool = false
}
