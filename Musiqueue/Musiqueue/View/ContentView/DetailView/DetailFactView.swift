//
//  DetailFactView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/13/24.
//

import SwiftUI

struct DetailFactView: View {
    let artist: Artist
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(artist.facts, id: \.self) { item in
                    Text(item)
                }
            } // TabView
            .tabViewStyle(.grouped)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } // GroupBox
    }
}

#Preview {
    DetailFactView(artist: Artist.sampleArtist)
}
