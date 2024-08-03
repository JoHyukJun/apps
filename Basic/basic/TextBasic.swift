//
//  TextBasic.swift
//  Basic
//
//  Created by johyukjun on 8/3/24.
//

import SwiftUI

struct TextBasic: View {
    var body: some View {
        VStack(spacing: 10) {
            // font 사이즈를 title, body, footnote 등으로 정하면 respoinsive
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
                .fontWeight(.semibold)
                .underline(true, color: Color.red)
                .italic()
                .strikethrough(true, color: Color.green)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
                .bold() // .fontWeight(.bold)
                .underline(true, color: Color.red)
                .italic()
                .strikethrough(true, color: Color.green)
            
            // 이 방법으로 하게 되면 text 크기를 지정 가능
            Text("Hello, World!-static".uppercased())
                .font(.system(size: 20, weight: .semibold, design: .serif))
            
            // multiline text alignment
            Text("Multi Line Text Alignment!")
                .multilineTextAlignment(.leading)
            Text("Multi Line Text Alignment!")
                .multilineTextAlignment(.center)
            Text("Multi Line Text Alignment!")
                .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    TextBasic()
}
