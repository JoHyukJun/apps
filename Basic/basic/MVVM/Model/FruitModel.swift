//
//  FruitModel.swift
//  Basic
//
//  Created by johyukjun on 10/6/24.
//

import Foundation


struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}
