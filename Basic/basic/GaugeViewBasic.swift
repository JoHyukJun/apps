//
//  GaugeViewBasic.swift
//  Basic
//
//  Created by johyukjun on 10/14/24.
//

import SwiftUI

struct GaugeViewBasic: View {
    // property
    @State var gaugeVal: Double = 0.5
    let gradient = Gradient(colors: [.green, .yellow, .red, .blue])
    
    
    var body: some View {
        Gauge(value: gaugeVal, label: {
//            Text("40 percent")
        }, currentValueLabel: {
            Text("\(gaugeVal * 100, specifier: "%.2f")%")
                .font(.caption)
        }) // Gauge
        .gaugeStyle(.accessoryLinear)
        .tint(gradient)
        .padding()
    }
}

#Preview {
    GaugeViewBasic()
}
