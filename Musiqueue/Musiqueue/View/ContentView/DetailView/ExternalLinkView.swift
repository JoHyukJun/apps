//
//  ExternalLinkView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/13/24.
//

import SwiftUI

struct ExternalLinkView: View {
    let artist: Artist
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Direct Website Link")
                
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(destination: (URL(string: artist.uri)!)) {
                        Text(artist.name)
                    }
                    .foregroundColor(.accentColor)
                }
            }
        }
    }
}

#Preview {
    ExternalLinkView(artist: Artist.sampleArtist)
}
