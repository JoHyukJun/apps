//
//  SymbolVariantBasic.swift
//  Basic
//
//  Created by johyukjun on 10/14/24.
//

import SwiftUI

struct SymbolVariantBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Symbol Variant")
                .font(.largeTitle)
                .foregroundStyle(.blue)
            
            List {
                Label("none", systemImage: "heart")
                    .symbolVariant(.none)
                Label("fill", systemImage: "heart")
                    .symbolVariant(.fill)
                Label("circle", systemImage: "heart")
                    .symbolVariant(.circle)
                Label("circle fill", systemImage: "heart")
                    .symbolVariant(.circle.fill)
                Label("rectangle", systemImage: "heart")
                    .symbolVariant(.rectangle)
                Label("rectangle fill", systemImage: "heart")
                    .symbolVariant(.rectangle.fill)
                Label("squre", systemImage: "heart")
                    .symbolVariant(.square)
                Label("squre fill", systemImage: "heart")
                    .symbolVariant(.square.fill)
                Label("slash", systemImage: "heart")
                    .symbolVariant(.slash)
                Label("slash fill", systemImage: "heart")
                    .symbolVariant(.slash.fill)
            }
            
            Spacer()
        }
    }
}

#Preview {
    SymbolVariantBasic()
}
