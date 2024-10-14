//
//  DetailGalleryView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/9/24.
//

import SwiftUI

struct DetailGalleryView: View {
    // property
    let artist: Artist
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(artist.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        } // ScrollView
    }
}

#Preview {
    DetailGalleryView(artist: Artist.sampleArtist)
}
