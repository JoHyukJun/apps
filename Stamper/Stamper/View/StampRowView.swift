//
//  StampRowView.swift
//  Stamper
//
//  Created by johyukjun on 11/9/24.
//

import SwiftUI

struct StampRowView: View {
    let index: Int
    
    var body: some View {
        HStack(spacing: 10) {
            Text("Name\(index)")
            
            Text("Company\(index)")
                .font(.caption)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(alignment: .topTrailing) {
            Button {
                
            } label: {
                Image(systemName: "star")
                    .symbolVariant(.fill)
                    .foregroundStyle(.yellow)
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    StampRowView(index: 1)
}
