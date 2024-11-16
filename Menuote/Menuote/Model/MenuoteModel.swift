//
//  MenuoteModel.swift
//  Menuote
//
//  Created by johyukjun on 11/11/24.
//

import Foundation
import SwiftData


@Model
class MenuoteModel {
    var title: String
    var content: String
    var createdAt: Date
    var updatedAt: Date
    var isPinned: Bool
    
    init(title: String, content: String, createdAt: Date, updatedAt: Date, isPinned: Bool) {
        self.title = title
        self.content = content
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.isPinned = isPinned
    }
}
