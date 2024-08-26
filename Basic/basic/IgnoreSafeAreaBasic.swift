//
//  IgnoreSafeAreaBasic.swift
//  Basic
//
//  Created by johyukjun on 8/24/24.
//

import SwiftUI

struct IgnoreSafeAreaBasic: View {
    var body: some View {
        ZStack {
            // background
            Color.blue
                .ignoresSafeArea()
            //.ignoresSafeArea(edges: .top)
            
            
            VStack {
                Text("hello there")
                    .font(.largeTitle)
            }
        }
        
        ScrollView {
            VStack {
                Text("box list")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                
                ForEach(1..<11) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding()
                        .overlay(
                            Text("\(index)")
                                .foregroundColor(.blue)
                        )
                }
            }
        }
        .background(
            Color.blue
                .ignoresSafeArea()
        )
    }
}

#Preview {
    IgnoreSafeAreaBasic()
}
