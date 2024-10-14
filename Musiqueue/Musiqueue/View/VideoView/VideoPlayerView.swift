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
            YoutubeView(videoId: video.videoid)
        }
    }
}

#Preview {
    VideoPlayerView(video: Video.sampleVideoData)
}
