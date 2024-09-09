//
//  ContextMenuBasic.swift
//  Basic
//
//  Created by johyukjun on 9/8/24.
//

import SwiftUI

struct ContextMenuBasic: View {
    // property
    @State var statusText: String = ""
    @State var bgColor: Color = Color.cyan
    
    var body: some View {
        VStack(spacing: 30) {
            Text(statusText)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("context menu test")
                    .font(.headline)
                Text("press button to activate context menu")
                    .font(.subheadline)
            }
            .foregroundColor(.white)
            .padding(30)
            .background(bgColor)
            .cornerRadius(20)
            .contextMenu{
                Button {
                    statusText = "share"
                    bgColor = .yellow
                } label: {
                    Label {
                        // title
                        Text("share post")
                    } icon: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }

                Button {
                    statusText = "report"
                    bgColor = .red
                } label: {
                    Label {
                        // title
                        Text("report post")
                    } icon: {
                        Image(systemName: "exclamationmark.bubble")
                    }
                }
                
                Button {
                    statusText = "like"
                    bgColor = .green
                } label: {
                    Label {
                        // title
                        Text("like post")
                    } icon: {
                        Image(systemName: "hand.thumbsup")
                    }
                }
            } // context menu
        }
    }
}

#Preview {
    ContextMenuBasic()
}
