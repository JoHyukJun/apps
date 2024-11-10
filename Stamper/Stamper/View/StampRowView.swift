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
                vm.stamp.isFav.toggle()
                
                save()
            } label: {
                Image(systemName: "star")
                    .symbolVariant(.fill)
                    .foregroundStyle(vm.stamp.isFav ? .yellow : .gray.opacity(0.3))
            }
        }
        .padding(.vertical)
    }
    
    func save() {
        do {
            try vm.viewModelSave()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
