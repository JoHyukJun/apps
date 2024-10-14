//
//  ChartsBasic.swift
//  Basic
//
//  Created by johyukjun on 10/14/24.
//

import SwiftUI
import Charts


// MARK: Sample model data
struct WeightModel: Identifiable {
    var id: String = UUID().uuidString
    var day: String
    var weight: Double
}

var weightData: [WeightModel] = [
    WeightModel(day: "Sun", weight: 77),
    WeightModel(day: "Mon", weight: 78),
    WeightModel(day: "Tue", weight: 76),
    WeightModel(day: "Wed", weight: 77),
    WeightModel(day: "Thu", weight: 79),
    WeightModel(day: "Fri", weight: 82),
    WeightModel(day: "Sat", weight: 81),
]


// MARK: View
struct ChartsBasic: View {
    var body: some View {
        // custom color array
        let barColor: [Color] = [.red, .blue, .black, .green, .yellow, .purple, .teal]
        ScrollView {
            VStack(spacing: 20) {
                Text("Bar chart")
                
                Chart(weightData) { item in
                    BarMark(
                        x: .value("Day", item.day),
                        y: .value("Weight", item.weight)
                    )
                    .foregroundStyle(by: .value("Day", item.day))
                    .annotation(position: .top) {
                        Image(systemName: "square.and.arrow.down")
                            .foregroundStyle(.red)
                    }
                } // Chart
                // customColor
                .chartForegroundStyleScale(
                    domain: weightData.compactMap({ weight -> String in
                        weight.day
                    }),
                    range: barColor
                )
                .frame(height: 200)
                
                Divider()
                
                Text("Line chart")
                
                Chart(weightData) { item in
                    LineMark(
                        x: .value("Day", item.day),
                        y: .value("Weight", item.weight)
                    )
//                    .lineStyle(StrokeStyle(lineWidth: 10))
//                    .symbol(by: .value("Day", item.day))
                    .interpolationMethod(.linear)
                } // Chart
                .frame(height: 200)
                
                Divider()
                
                Text("Rectangle chart")
                
                Chart(weightData) { item in
                    RectangleMark(
                        x: .value("Day", item.day),
                        y: .value("Weight", item.weight)
                    )
                } // Chart
                .frame(height: 200)
                
                Divider()
                
                Text("Area chart")
                
                Chart(weightData) { item in
                    AreaMark(
                        x: .value("Day", item.day),
                        y: .value("Weight", item.weight)
                    )
                    .interpolationMethod(.catmullRom)
                    
                    RuleMark(y: .value("MID", 80))
                        .foregroundStyle(.red)
                } // Chart
                .frame(height: 200)
            } // VStack
        } // ScrollView
        .padding()
    }
}

#Preview {
    ChartsBasic()
}
