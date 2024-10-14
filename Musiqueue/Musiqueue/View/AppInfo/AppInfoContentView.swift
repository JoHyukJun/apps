//
//  AppInfoContentView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/13/24.
//

import SwiftUI

struct AppInfoContentView: View {
    // property
    var name: String
    
    // optional property
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .foregroundColor(.gray)
                
                // condition
                if (content != nil)
                {
                    Text(content ?? "nil")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .hTrailing()
                }
                else if (linkLabel != nil && linkDestination != nil)
                {
                    Link(destination: URL(string: "https://\(linkDestination!)")!) {
                        Spacer()
                        
                        Text(linkLabel!)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                    }
                    
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.accentColor)
                }
                else
                {
                    EmptyView()
                }
                
                Divider()
            }
        }
    }
}

#Preview {
    Group {
        AppInfoContentView(name: "sample", content: "Unlucky Strike")
        AppInfoContentView(name: "sample", linkLabel: "Unlucky Strike", linkDestination: "https://unluckystrike.com")
    }
    
    
}
