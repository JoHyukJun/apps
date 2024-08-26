//
//  ExtractSubViewBasic.swift
//  Basic
//
//  Created by johyukjun on 8/25/24.
//

import SwiftUI

struct ExtractSubViewBasic: View {
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            
            // content
            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            ItemBasic(title: "apple", count: 1, color: .red)
            ItemBasic(title: "orange", count: 10, color: .orange)
            ItemBasic(title: "banana", count: 30, color: .yellow)
        }
    }
}

#Preview {
    ExtractSubViewBasic()
}
