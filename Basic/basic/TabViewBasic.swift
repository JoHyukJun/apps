//
//  TabViewBasic.swift
//  Basic
//
//  Created by johyukjun on 10/3/24.
//

import SwiftUI

struct TabViewBasic: View {
    // property
    @State var initPageIdx: Int = 0
    
    var body: some View {
        TabView(selection: $initPageIdx) {
            HomeView(selectedTab: $initPageIdx)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            Text("globe")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Globe")
                }
                .tag(1)
            
            Text("profile")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .accentColor(.red)
    }
}

struct HomeView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            // background color
            Color.red.ignoresSafeArea()
            
            // foreground
            VStack(spacing: 20) {
                Text("home")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("profile")
                }
            } // VStack
        }
    }
}

#Preview {
    TabViewBasic()
}
