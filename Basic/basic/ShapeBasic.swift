//
//  ShapeBasic.swift
//  Basic
//
//  Created by johyukjun on 8/4/24.
//

import SwiftUI

struct ShapeBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            // circle
            Text("circle")
                .font(.title)
            Circle()
//                .fill(Color.blue)
//                .foregroundColor(.pink)
//                .stroke(Color.red, lineWidth: 20)
//                .stroke(Color.purple, style: StrokeStyle(lineWidth: 30, lineCap: .butt, dash: [30]))
                .trim(from: 0.5, to: 1.0)
                .stroke(Color.pink, lineWidth: 20)
                .frame(width: 200, height: 100, alignment: .center)
                .padding()

            // ellipse
            Text("ellipse")
                .font(.title)
            Ellipse()
                .fill(Color.green)
                .frame(width: 200, height: 100, alignment: .center)
            
            // capsule
            Text("capsule")
                .font(.title)
            Capsule(style: .circular)
                .stroke(Color.blue, lineWidth: 30)
                .frame(width: 200, height: 100, alignment: .center)
        }
        
        VStack(spacing: 20) {
            // rectangle
            Text("rectangle")
                .font(.title)
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 100, alignment: .center)
            
            // rounded rectangle
            Text("rounded rectangle")
                .font(.title)
            RoundedRectangle(cornerRadius: 20.0)
                .trim(from: 0.4, to: 1.0)
                .frame(width: 200, height: 100, alignment: .center)
        }
    }
}

#Preview {
    ShapeBasic()
}
