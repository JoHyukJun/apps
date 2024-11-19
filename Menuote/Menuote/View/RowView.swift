//
//  RowView.swift
//  Menuote
//
//  Created by johyukjun on 11/19/24.
//

import SwiftUI

struct RowView: View {
    let menuote: MenuoteModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(menuote.title)
                        
                    Image(systemName: menuote.isPinned ? "pin.fill" : "")
                }
                
                Text(menuote.formattedDate())
                    .font(.caption)
            }
        }
    }
}
