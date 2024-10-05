//
//  OnTabGestureBasic.swift
//  Basic
//
//  Created by johyukjun on 10/5/24.
//

import SwiftUI

struct OnTabGestureBasic: View {
    // property
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 200)
                .foregroundColor(isSelected ? Color.green : Color.red)
            
            Button {
                isSelected.toggle()
            } label: {
                Text("general button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
            
            // onTabGesture
            Text("onTabGesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(20)
                .onTapGesture {
                    isSelected.toggle()
                }
            
            // onTabGesture Customize
            Text("onTabGesture double tap")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(20)
                .onTapGesture(count: 2) {
                    isSelected.toggle()
                }
        } // VStack
        .padding()
    }
}

#Preview {
    OnTabGestureBasic()
}
