//
//  ContentView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/6/24.
//

import SwiftUI

struct ContentView: View {
    // property
    @ObservedObject var artistVM: ArtistViewModel
    
    var body: some View {
        NavigationView {
            List {
                CoverImageView(artistVM: artistVM)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(artistVM.artists) { artist in
                    NavigationLink {
                        
                    } label: {
                        ArtistListView(artist: artist)
                            .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                    }
                }
                
                CreditView()
                    .hCenter()
            } // List
            .listStyle(.plain)
            .navigationTitle("Home")
            .frame(minWidth: 200)
        } // NavigtationView
    }
}

#Preview {
    ContentView(artistVM: ArtistViewModel())
}
