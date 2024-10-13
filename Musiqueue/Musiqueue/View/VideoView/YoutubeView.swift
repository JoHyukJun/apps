//
//  YoutubeView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/13/24.
//

import SwiftUI
import WebKit


struct YoutubeView: NSViewRepresentable {
    let videoId: String
    
    func makeNSView(context: Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: config)
        
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }
        nsView.load(URLRequest(url: youtubeURL))
    }
}
