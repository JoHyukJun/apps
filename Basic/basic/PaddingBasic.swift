//
//  PaddingBasic.swift
//  Basic
//
//  Created by johyukjun on 8/15/24.
//

import SwiftUI

struct PaddingBasic: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("hello there")
                .background(Color.yellow)
                .padding(.all, 15) // .padding(.all, 15)
                .background(Color.orange)
                .padding(.leading, 20) // css padding
                .background(Color.blue)
                .padding(.bottom, 20)
                .background(Color.red) // css margin
            
            Divider()
            
            Text("hello there")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            
            Text("test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test ")
        }
        .padding()
        .padding(.vertical, 30)
        .background(
            Color.gray
                .cornerRadius(10)
                .shadow(
                    color: Color.black,
                    radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
                    x: 10, y: 10
                )
        )
        .padding()
    }
}

#Preview {
    PaddingBasic()
}
