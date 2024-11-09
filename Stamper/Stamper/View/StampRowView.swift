//
//  StampRowView.swift
//  Stamper
//
//  Created by johyukjun on 11/9/24.
//

import SwiftUI

struct StampRowView: View {
    @ObservedObject var vm: StampViewModel
    
    var body: some View {
        HStack(spacing: 10) {
            Text(vm.stamp.name)
            
            Text(vm.stamp.company)
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
