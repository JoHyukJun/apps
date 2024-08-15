//
//  StackBasic.swift
//  Basic
//
//  Created by johyukjun on 8/15/24.
//

import SwiftUI

struct StackBasic: View {
    var body: some View {
        // vstack
        VStack(alignment: .leading, spacing: 20) {
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
            
            Rectangle()
                .fill(Color.green)
                .frame(width: 150, height: 150)
            
            Rectangle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
        }
        
        // hstack
        HStack(spacing: 20) {
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
            
            Rectangle()
                .fill(Color.green)
                .frame(width: 150, height: 150)
            
            Rectangle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
        }
        
        // zstack
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
            
            Rectangle()
                .fill(Color.green)
                .frame(width: 150, height: 150)
            
            Rectangle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
        }
        
        // combine
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 350, height: 500)
            
            VStack(alignment: .leading, spacing: 30) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 150, height: 150)
                
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 100, height: 100)
                
                HStack(alignment: .bottom, spacing: 10) {
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: 50, height: 50)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 50, height: 50)
                    
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: 50, height: 50)
                }
                .background(Color.white)
                
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
            }
            .background(Color.black)
        }
        
        // zstack and background
        VStack(spacing: 50) {
            // zstack
            ZStack() {
                Circle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                
                Text("1")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            // background
            Text("1")
                .font(.title)
                .foregroundStyle(.white)
                .background(
                    Circle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                    )
        }
    }
}

#Preview {
    StackBasic()
}
