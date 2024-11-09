//
//  StampViewModel.swift
//  Stamper
//
//  Created by johyukjun on 11/9/24.
//

import Foundation
import CoreData


final class StampViewModel: ObservableObject {
    let provider: StampProvider
    let context: NSManagedObjectContext
    
    init(provider: StampProvider) {
        self.provider = provider
        self.context = provider.viewContext
    }
}
