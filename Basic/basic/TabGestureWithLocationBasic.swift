//
//  TabGestureWithLocationBasic.swift
//  Basic
//
//  Created by johyukjun on 10/14/24.
//

import SwiftUI

struct TabGestureWithLocationBasic: View {
    // property
    @State var point: CGPoint = .init(x: 0.0, y: 0.0)
    @State var xVal: Double = 0.0
    @State var yVal: Double = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("x: ")
                Text("\(xVal)")
                
                Text("y: ")
                Text("\(yVal)")
            } // HStack
            
            // Rectangle position
            Rectangle()
                .fill(Color.green)
                .frame(height: 300)
                .padding()
                .onTapGesture { location in
                    point = location
                    converToDouble(point: point)
                }
            
            // Screen position
            Rectangle()
                .fill(Color.blue)
                .frame(height: 300)
                .padding()
                .onTapGesture(coordinateSpace: .global) { location in
                    point = location
                    converToDouble(point: point)
                }
        } // VStack
    }
    
    
    func converToDouble(point: CGPoint) {
        xVal = Double(point.x)
        yVal = Double(point.y)
    }
}

#Preview {
    TabGestureWithLocationBasic()
}
