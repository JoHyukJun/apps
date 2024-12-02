//
//  Item.swift
//  AcrossFloor
//
//  Created by Jo Hyuk Jun on 12/2/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
