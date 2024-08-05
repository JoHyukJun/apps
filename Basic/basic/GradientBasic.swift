//
//  GradientBasic.swift
//  Basic
//
//  Created by johyukjun on 8/4/24.
//

import SwiftUI

struct GradientBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            // linear gradient
            Text("linear gradient")
                .font(.title)
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.red, Color.blue]),
                        startPoint: .topLeading,
                        endPoint: .bottom)
                )
                .frame(width: 200, height: 100, alignment: .center)
           
            // radial gradient
            Text("radial gradient")
                .font(.title)
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [Color.yellow, Color.purple]),
                        center: .leading,
                        startRadius: 5,
                        endRadius: 100)
                )
                .frame(width: 200, height: 100, alignment: .center)
            
            // angular radient
            Text("angular gradient")
                .font(.title)
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    AngularGradient(
                        gradient: Gradient(colors: [Color.white, Color.pink]),
                        center: .topLeading,
                        angle: .degrees(100))
                )
                .frame(width: 200, height: 100, alignment: .center)
        }
    }
}

#Preview {
    GradientBasic()
}
