//
//  BackgroundBasic.swift
//  Basic
//
//  Created by johyukjun on 8/4/24.
//

import SwiftUI

struct BackgroundBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            // background
            Text("Hello there")
                .frame(width: 100, height: 100)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]),
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                )
                .frame(width: 150, height: 150)
                .background(
                    Circle()
                        .fill(Color.red)
                )
            
            Divider()
            
            // overlay
            Circle()
                .fill(Color.pink)
                .frame(width: 100, height: 100)
                .overlay(
                    Text("the one")
                        .font(.title)
                        .foregroundColor(Color.white)
                )
                .background(
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 150, height: 150)
                )
            
            Divider()
            
            // background and overlay
            Rectangle()
                .frame(width: 200, height: 200)
                .overlay(
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                    , alignment: .leading
                )
                .background(
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 250, height: 250)
                )
//                .padding()
            
            Divider()
            
            Image(systemName: "heart.fill")
                .font(.system(size: 40))
                .foregroundColor(Color.white)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.red, Color.blue]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 100, height: 100)
                        .shadow(color: Color.blue, radius: 10, x: 0, y: 10)
                        .overlay(
                            Circle()
                                .fill(Color.red)
                                .frame(width: 30, height: 30)
                                .overlay(
                                    Text("42")
                                        .font(.headline)
                                        .foregroundColor(Color.white)
                                )
                                .shadow(color: Color.red, radius: 10, x: 5, y: 5)
                            , alignment: .bottomTrailing
                        )
                )
                .padding()
        }
    }
}

#Preview {
    BackgroundBasic()
}
