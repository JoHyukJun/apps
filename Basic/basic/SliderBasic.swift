//
//  SliderBasic.swift
//  Basic
//
//  Created by johyukjun on 10/3/24.
//

import SwiftUI

struct SliderBasic: View {
    // property
    @State var sliderValue: Double = 3
    @State var color: Color = .blue
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("level: ")
                Text("\(sliderValue)")
                Text(String(format: "%.0f", sliderValue))
            } // HStack
            .foregroundColor(color)
           
            // value: only float(not double or int)
            // in: slider range
            // step: inc, dec step size
            // onEditChanged: slider value event
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 1.0,
                onEditingChanged: { _ in
                    color = .red
                },
                minimumValueLabel: Text("1"),
                maximumValueLabel: Text("5"),
                label: {
                    Text("label")
                }
                )
            .accentColor(.red)
            .padding()
        } // VStack
    }
}

#Preview {
    SliderBasic()
}
