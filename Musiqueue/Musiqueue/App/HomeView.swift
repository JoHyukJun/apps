//
//  HomeView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/7/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            VideoView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Video")
                }
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
            
            AppInfoView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Info")
                }
        }
    }
}

#Preview {
    HomeView()
}
