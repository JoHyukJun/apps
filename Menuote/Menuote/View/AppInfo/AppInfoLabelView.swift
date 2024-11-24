//
//  AppInfoLabelView.swift
//  Menuote
//
//  Created by johyukjun on 11/24/24.
//

import SwiftUI

struct AppInfoLabelView: View {
    // property
    let labelText: String
    let labelImage: String
    
    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            
            Image(systemName: labelImage)
                .hTrailing()
        } // HStack
    }
}
