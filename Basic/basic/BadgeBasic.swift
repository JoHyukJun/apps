//
//  BadgeBasic.swift
//  Basic
//
//  Created by johyukjun on 10/14/24.
//

import SwiftUI

struct BadgeBasic: View {
    var body: some View {
        TabView {
            Color.red.ignoresSafeArea(edges: .top)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("LOVE")
                }
                .badge(0)
            
            Color.green.ignoresSafeArea(edges: .top)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("LOVE")
                }
                .badge(5)
            
            Color.blue.ignoresSafeArea(edges: .top)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("LOVE")
                }
                .badge("NEW")
        } // TabView
        
        List {
            Text("Hello, there")
                .badge("NEW ITEMS!")
            Text("Hello, there")
                .badge(10)
        } // List
    }
}

#Preview {
    BadgeBasic()
}
