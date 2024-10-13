//
//  GalleryView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/7/24.
//

import SwiftUI

struct GalleryView: View {
    @ObservedObject var artistVM: ArtistViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30) {
                    Image(artistVM.selectedArtist)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.accentColor, lineWidth: 5)
                        )
                    
                    Slider(value: $artistVM.gridColumn, in: 2...4, step: 1)
                        .padding(0)
                        .onChange(of: artistVM.gridColumn) { prev, value in
                            withAnimation(Animation.easeInOut(duration: 1.0)) {
                                artistVM.gridSwitch()
                            }
                        }
                    
                    LazyVGrid(columns: artistVM.gridLayout, spacing: 20) {
                        ForEach(artistVM.artists) { artist in
                            Image(artist.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                                .onTapGesture {
                                    withAnimation(Animation.spring()) {
                                        artistVM.selectedArtist = artist.image
                                    }
                                }
                        } // ForEach
                    } // LazyVGrid
                } // VStack
                .padding()
            } // ScrollView
            .navigationTitle("Gallery")
        } // NavigationView
    }
}

#Preview {
    GalleryView(artistVM: ArtistViewModel())
}
