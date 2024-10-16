//
//  DetailView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/8/24.
//

import SwiftUI

struct DetailView: View {
    // property
    let artist: Artist
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(artist.image)
                    .resizable()
                    .scaledToFit()
                
                Text(artist.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.vertical, 10)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 25)
                    )
                
                Text(artist.profile)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.accentColor)
                    .padding()
                
                Group {
                    DetailHeadView(headingImage: "photo.on.rectangle.angled", headingText: "\(artist.name) Images")
                    
                    DetailGalleryView(artist: artist)
                    
                } // Group
                
                Group {
                    DetailHeadView(headingImage: "info.circle", headingText: "Information")
                    
                    ForEach(artist.urls, id: \.self) { url in
                        Text(url)
                            .font(.subheadline)
                    }
                } // Group
                
                Group {
                    DetailHeadView(headingImage: "location.magnifyingglass", headingText: "Fact")
                    
                    DetailFactView(artist: artist)
                } // Group
                
                Group {
                    DetailHeadView(headingImage: "books.vertical", headingText: "References")
                    
                    ExternalLinkView(artist: artist)
                } // Group
            } // VStack
            .navigationTitle("\(artist.name) details")
        }
    }
}

#Preview {
    DetailView(artist: Artist.sampleArtist)
}
