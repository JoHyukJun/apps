//
//  FruitViewModel.swift
//  Basic
//
//  Created by johyukjun on 10/6/24.
//

import Foundation


class FruitViewModel: ObservableObject {
    // property
    // Published wrapper is similar to @State but used in class
    // If array is changed in view, @Published will notice and update variables in ViewModel
    @Published var fruits: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    // func
    func getFruits() {
        let fruit1 = FruitModel(name: "Apple", count: 100)
        let fruit2 = FruitModel(name: "Banana", count: 200)
        let fruit3 = FruitModel(name: "Orange", count: 300)
        
        // 3sec delay and append to array
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.fruits.append(fruit1)
            self.fruits.append(fruit2)
            self.fruits.append(fruit3)
            
            self.isLoading = false
        }
    }
    
    func deleteFruit(index: IndexSet) {
        fruits.remove(atOffsets: index)
    }
}
