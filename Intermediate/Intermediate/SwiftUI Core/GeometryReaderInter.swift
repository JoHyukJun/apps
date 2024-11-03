//
//  GeometryReaderInter.swift
//  Intermediate
//
//  Created by johyukjun on 11/2/24.
//

import SwiftUI

struct GeometryReaderInter: View {
    var body: some View {
        
        // GeometryReader: 컨텐츠의 크기와 위치를 함수로 나타내는 컨테이너 뷰
        // proxy: 측정된 크기를 view 에서 사용할때 사용하는 값
        GeometryReader { proxy in
            HStack(spacing: 0) {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: proxy.size.width * 0.6)
                
                Rectangle()
                    .fill(Color.blue)
            }
            .ignoresSafeArea()
        }
    }
}

struct GeometryReaderInter2: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(1..<10) { idx in
                    GeometryReader { proxy in
                        Image("logo \(idx)")
                            .resizable()
                            .scaledToFit()
                            .rotation3DEffect(Angle(degrees: getPercentage(geo: proxy) * 40), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300, height: 300)
                    .padding()
                }
            }
        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = geo.frame(in: .global).maxX / 2
        
        // frame(in: .global): 전체 screen 의 크기에서 사진 크기의 가운데 값 설정
        let currentX = geo.frame(in: .global).midX
        
        // return 값으로 사진가운데 기준으로 right, left 값을 다르게 설정
        
        return (1 - (currentX / maxDistance))
    }
}

#Preview {
    GeometryReaderInter()
}

#Preview("GeometryReaderInter2") {
    GeometryReaderInter2()
}
