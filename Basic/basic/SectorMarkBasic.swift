//
//  SectorMarkBasic.swift
//  Basic
//
//  Created by johyukjun on 10/15/24.
//

import SwiftUI
import Charts


// model
struct SectorMarkData: Identifiable {
    let id = UUID()
    let label: String
    let value: Int
    
    static func fetchData() -> [SectorMarkData] {
        [
            SectorMarkData(label: "derek", value: 35),
            SectorMarkData(label: "karma", value: 20),
            SectorMarkData(label: "police", value: 20),
            SectorMarkData(label: "sudi", value: 25),
        ]
    }
}

struct SectorMarkBasic: View {
    // property
    private let records: [SectorMarkData] = SectorMarkData.fetchData()
    
    var body: some View {
        VStack {
            Chart(records) { data in
                // pie chart
                // .angle: 차트에서 나누는 기준값
                // .angularInset: 구분선 넓이
                SectorMark(angle: .value("Record", data.value), angularInset: 4)
                    .cornerRadius(10)
                    .blur(radius: data.label == "derek" ? 5 : 0)
                    .foregroundStyle(by: .value("Record Label", data.label))
            }
            .padding()
            
            Chart(records) {data in
                // donut chart
                SectorMark(angle: .value("Record", data.value),
                           // inderRadius: 크기 도넛 원형 설정
                           innerRadius: MarkDimension.ratio(0.5),
                           // outerRadius: 원형 밖의 padding 값 설정
                           outerRadius: MarkDimension.inset(50)
                )
                .foregroundStyle(by: .value("Record Label", data.label))
            }
        }
        .chartLegend(position: .bottom, alignment: .center, spacing: 10)
        .dynamicTypeSize(.accessibility2)
        .padding(.horizontal)
    }
}

#Preview {
    SectorMarkBasic()
}
