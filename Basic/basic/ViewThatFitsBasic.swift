//
//  ViewThatFitsBasic.swift
//  Basic
//
//  Created by johyukjun on 10/14/24.
//

import SwiftUI

struct ViewThatFitsBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ViewThatFits Horizontal")
                .font(.title.bold())
                .foregroundStyle(.blue)
            
            // Screen size
            ViewThatFits(in: .horizontal) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.red.opacity(0.7))
                    .overlay(
                        Text("Landscape")
                        )
                    .frame(width: 700, height: 75)
            
                RoundedRectangle(cornerRadius: 15)
                    .fill(.blue.opacity(0.7))
                    .overlay(
                        Text("Portrait")
                        )
                    .frame(width: 350, height: 75)
            }
        } // VStack
        .padding()
        
        VStack(spacing: 20) {
            Text("ViewThatFits Vertical")
                .font(.title.bold())
                .foregroundStyle(.blue)
            
            // Screen size
            ViewThatFits(in: .vertical) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.red.opacity(0.7))
                    .overlay(
                        Text("Landscape")
                        )
                    .frame(width: 200, height: 500)
            
                RoundedRectangle(cornerRadius: 15)
                    .fill(.blue.opacity(0.7))
                    .overlay(
                        Text("Portrait")
                        )
                    .frame(width: 400, height: 100)
            }
        } // VStack
        .padding()
    }
}

struct ViewThatFitsPracticeTests: View {
    @State var count: Int = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Practice")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)
            
            ViewThatFits(in: .vertical) {
                // vertical 방향으로 사이즈를 계산한 다음 페이지 안넘어가면 첫번째 적용
                VStack(spacing: 10) {
                    ForEach(1...count, id:\.self) { idx in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.red)
                            .frame(height: 200)
                    }
                }
                
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(1...count, id:\.self) { idx in
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.red)
                                .frame(height: 200)
                        }
                    }
                }
            }
            .onTapGesture {
                count += 1
            }
        }
    }
}

#Preview("ViewThatFitsBasic") {
    ViewThatFitsBasic()
}

#Preview("ViewThatFitsPracticeTests") {
    ViewThatFitsPracticeTests()
}
