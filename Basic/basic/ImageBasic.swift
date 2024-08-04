//
//  ImageBasic.swift
//  Basic
//
//  Created by johyukjun on 8/4/24.
//

import SwiftUI

struct ImageBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("lego")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .cornerRadius(150)
            
            Divider()
            
            Image("lego")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
        }
    }
}

#Preview {
    ImageBasic()
}
