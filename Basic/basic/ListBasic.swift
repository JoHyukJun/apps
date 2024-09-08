//
//  ListBasic.swift
//  Basic
//
//  Created by johyukjun on 9/8/24.
//

import SwiftUI

struct ListBasic: View {
    // property
    @State var fruits: [String] = [
        "apple",
        "banana",
        "orange",
        "watermelon"
    ]
    @State var meats: [String] = [
        "beef",
        "pork",
        "chiken"
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    // content
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit)
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.blue)
                } header: {
                    Text("fruits")
                        .font(.headline)
                }
                
                Section {
                    // content
                    ForEach(meats, id: \.self) { meat in
                        Text(meat)
                            .font(.body)
                            .foregroundColor(.white)
                    }
                } header: {
                    Text("meats")
                        .font(.headline)
                }
            }
        }
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
}

#Preview {
    ListBasic()
}
