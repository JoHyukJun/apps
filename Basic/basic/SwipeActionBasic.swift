//
//  SwipeAction.swift
//  Basic
//
//  Created by johyukjun on 10/14/24.
//

import SwiftUI

struct SwipeActionBasic: View {
    // property
    @State var fruits: [String] = ["Apple", "Banana", "Orange"]
    
    var body: some View {
        List {
            ForEach(fruits, id:\.self) { fruit in
                Text(fruit)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        // content
                        Button {
                            // action
                        } label: {
                            Text("Save")
                        }
                        .tint(.green)
                        
                        Button {
                            // action
                        } label: {
                            Text("Delete")
                        }
                        .tint(.red)
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            // action
                        } label: {
                            Text("Share")
                        }
                        .tint(.yellow)
                    }
            }
        }
    }
}

#Preview {
    SwipeActionBasic()
}
