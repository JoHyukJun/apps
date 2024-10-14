//
//  AppInfoLabelView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/13/24.
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

#Preview {
    AppInfoLabelView(labelText: "AppInfoHead", labelImage: "gear")
}
