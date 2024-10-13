//
//  VideoView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/7/24.
//

import SwiftUI

struct VideoView: View {
    // property
    @ObservedObject var artistVM: ArtistViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(artistVM.videos) { video in
                    NavigationLink {
                        // destination
                        VideoPlayerView(video: video)
                    } label: {
                        VideoListItemView(video: video)
                    }

                }
            } // List
            .listStyle(.plain)
            .navigationTitle("Video")
            .frame(minWidth: 250)
        } // NavigationView
    }
}

#Preview {
    VideoView(artistVM: ArtistViewModel())
}
