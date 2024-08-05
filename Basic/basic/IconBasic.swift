//
//  IconBasic.swift
//  Basic
//
//  Created by johyukjun on 8/4/24.
//

import SwiftUI

struct IconBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "cat.circle")
                .resizable()
                .renderingMode(.original) // renderingMode 에서 original 로 하게되면 실제 color 에서 multi color 로 변경(고유 값 컬러로 변경)
                .scaledToFill()
                .foregroundColor(Color.red)
                .frame(width: 200, height: 100, alignment: .center)
            
            Image(systemName: "square.and.arrow.up.badge.clock")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.blue)
                .frame(width: 200, height: 100, alignment: .center)
        }
    }
}

#Preview {
    IconBasic()
}
