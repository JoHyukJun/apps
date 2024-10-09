//
//  DetailHeadView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/9/24.
//

import SwiftUI

struct DetailHeadView: View {
    // property
    var headingImage: String
    var headingText: String
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    DetailHeadView(headingImage: "gear", headingText: "head")
}
