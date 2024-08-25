//
//  BindingBasic.swift
//  Basic
//
//  Created by johyukjun on 8/25/24.
//

import SwiftUI

struct BindingBasic: View {
    // property
    @State var backgroundColor: Color = Color.green
    @State var title: String = "binding basic view"
    
    var body: some View {
        ZStack {
            // background
            backgroundColor
                .ignoresSafeArea()
            
            // content
            VStack {
                Text(title)
                
                // button
                BindingChild(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

#Preview {
    BindingBasic()
}
