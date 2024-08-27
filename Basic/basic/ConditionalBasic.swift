//
//  ConditionalBasic.swift
//  Basic
//
//  Created by johyukjun on 8/27/24.
//

import SwiftUI

struct ConditionalBasic: View {
    // property
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // loading button
            Button {
                isLoading.toggle()
            } label: {
                Text("loading...\(isLoading.description)")
            }
            
            // loading images
            if (isLoading) {
                ProgressView()
            }

            // circle button
            Button {
                showCircle.toggle()
            } label: {
                Text("circle button: \(showCircle.description)")
            }
            
            // rectangle button
            Button {
                showRectangle.toggle()
            } label: {
                Text("circle button: \(showRectangle.description)")
            }

            if (showCircle) {
                Circle()
                    .frame(width: 100, height: 100)
            }
            
            if (showRectangle) {
                Rectangle()
                    .frame(width: 100, height: 100)
            }
            
            if (showCircle == false && showRectangle == false) {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 200, height: 100)
            }
            
            if (showCircle == true || showRectangle == true) {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.red)
                    .frame(width: 200, height: 100)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ConditionalBasic()
}
