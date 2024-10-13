//
//  VideoPlayerView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/13/24.
//

import SwiftUI

struct VideoPlayerView: View {
    // property
    let video: Video
    
    var body: some View {
        VStack {
            Text(video.videoid)
            YoutubeView(videoId: video.videoid)
                .frame(height: 200)
        }
    }
}

#Preview {
    VideoPlayerView(video: Video.sampleVideoData)
}
