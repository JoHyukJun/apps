//
//  ScrollViewBasic.swift
//  Basic
//
//  Created by johyukjun on 8/15/24.
//

import SwiftUI

struct ScrollViewBasic: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                ForEach(0..<50) { index in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 300)
                        .overlay(
                            Text("\(index) idx")
                                .font(.title)
                        )
                }
            }
        }
        
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(0..<50) { index in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 300, height: 300)
                        .overlay(
                            Text("\(index) idx")
                                .font(.title)
                        )
                }
            }
        }
        
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack {
                ForEach(0..<50) { _ in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(0..<50) { index in
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewBasic()
}
