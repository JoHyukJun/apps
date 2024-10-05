//
//  DarkModeBasic.swift
//  Basic
//
//  Created by johyukjun on 10/5/24.
//

import SwiftUI

struct DarkModeBasic: View {
    // property
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // primary and secondary color
                    Text("primary color")
                        .foregroundColor(.primary)
                    
                    Text("secondary color")
                        .foregroundColor(.secondary)
                    
                    // general color
                    Text("black color")
                        .foregroundColor(.black)
                    
                    Text("white color")
                        .foregroundColor(.white)
                    
                    Text("red color")
                        .foregroundColor(.red)
                    
                    // adaptive color set
                    Text("adaptive color")
                        .foregroundColor(Color("AdaptiveColor"))
                    
                    // @Enviroment color scheme
                    Text("@Enviroment adaptive color")
                        .foregroundColor(colorScheme == .light ? .green : .blue)
                }
            }
        }
    }
}

#Preview {
    DarkModeBasic()
}
