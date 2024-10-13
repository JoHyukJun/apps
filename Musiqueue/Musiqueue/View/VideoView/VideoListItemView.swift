//
//  VideoListItemView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/13/24.
//

import SwiftUI

struct VideoListItemView: View {
    // property
    let video: Video
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.id)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 90)
                    .cornerRadius(10)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 5)
            } // ZStack
            
            VStack(spacing: 10) {
                Text(video.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                    .hLeading()
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
            } // VStack
        } // HStack
    }
}

#Preview {
    VideoListItemView(video: Video.sampleVideoData)
}
