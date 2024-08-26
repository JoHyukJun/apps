//
//  LazyGridBasic.swift
//  Basic
//
//  Created by johyukjun on 8/24/24.
//

import SwiftUI

struct LazyGridBasic: View {
    // LazyVGrid column setting
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
    ]
    
    // LazyHGrid
    let title: [String] = Array(1...1000).map {"list \($0)"}
    let layout: [GridItem] = [
        GridItem(.flexible(maximum: 80)),
        GridItem(.flexible(maximum: 80)),
        GridItem(.flexible(maximum: 80)),
        GridItem(.flexible(maximum: 80)),
    ]
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.orange)
                .frame(height: 400)

            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders]) {
                    Section(header: Text("section1")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.blue)
                        .padding()
                    ) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 150)
                                .overlay(
                                    Text("\(index)")
                                )
                        }
                    } // section 1
                    
                    Section(header: Text("section 2")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.green)
                        .padding()
                    ) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(Color.red)
                                .frame(height: 150)
                                .overlay(
                                    Text("\(index)")
                                )
                        }
                    } // section 2
                }
        }
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout, spacing: 20) {
                ForEach(title, id: \.self) { item in
                    VStack {
                        Capsule()
                            .fill(Color.yellow)
                            .frame(height: 30)
                        
                        Text(item)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

#Preview {
    LazyGridBasic()
}
