//
//  TextMarkdownBasic.swift
//  Basic
//
//  Created by johyukjun on 10/14/24.
//

import SwiftUI

struct TextMarkdownBasic: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Markdown")
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            Text("*Italic*")
            Text("_Italic_")
            Text("**Bold**")
            Text("***Bold & Italic***")
            Text("___Bold & Italic___")
            Text("[URL](https://www.apple.com)")
            Text("`print(test)`")
            
            Spacer()
        }
        .padding()
        .font(.title)
        
        VStack(spacing: 10) {
            Text("Text Selection")
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            Text("Text Selection default")
            
            Text("Text Selection enabled")
                .textSelection(.enabled)
        }
    }
}

#Preview {
    TextMarkdownBasic()
}
