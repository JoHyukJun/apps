//
//  ScrollTransitionBasic.swift
//  Basic
//
//  Created by johyukjun on 10/30/24.
//

import SwiftUI

struct ScrollTransitionBasic: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 30) {
                ForEach(1...3, id: \.self) { idx in
                    Image("logo\(String(idx))")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .padding()
                        .containerRelativeFrame(.horizontal)
                }
            }
            // 오직 main view 에서만 ScrollView 가 되고 subView 에서는 ScrollView 가 안되게 설정
            .scrollTargetLayout()
        } // ScrollView
        .scrollTargetBehavior(.viewAligned)
    }
}

struct ScrollTransitionView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 20) {
                ForEach(1...30, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.blue.gradient)
                        .frame(height: 100)
                        .scrollTransition(
                            topLeading: .animated,
                            bottomTrailing: .interactive
                        ) { view, phase in
                            view
                                .opacity(1 - (phase.value < 0 ? -phase.value : phase.value))
                        }
                }
            } // LazyVStack
            .padding()
        }
    }
}

#Preview {
    ScrollTransitionBasic()
}

#Preview("ScrollTransitionView") {
    ScrollTransitionView()
}
