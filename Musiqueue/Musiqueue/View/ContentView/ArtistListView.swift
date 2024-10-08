//
//  ArtistListView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/8/24.
//

import SwiftUI

struct ArtistListView: View {
    // property
    let artist: Artist
    
    var body: some View {
        HStack(spacing: 20) {
            Image(artist.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack {
                Text(artist.name)
                    .hLeading()
                    .font(.headline)
                    .foregroundColor(.accentColor)
                
                Text(artist.profile)
                    .font(.footnote)
                    .lineLimit(2)
                    .padding(.trailing, 10)
            } // VStack
        } // HStack
    }
}

#Preview {
    ArtistListView(artist: Artist.sampleArtist)
}
