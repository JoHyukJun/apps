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
        VStack {
            ForEach(artistVM.artists) { artist in
                Text(artist.name)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(artistVM: ArtistViewModel())
}
