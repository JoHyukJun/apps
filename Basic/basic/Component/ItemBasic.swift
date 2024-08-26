//
//  ItemBasic.swift
//  Basic
//
//  Created by johyukjun on 8/25/24.
//

import SwiftUI

struct ItemBasic: View {
    // property
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}

#Preview {
    ItemBasic(title: "apple", count: 1, color: .red)
        .previewLayout(.sizeThatFits)
}
