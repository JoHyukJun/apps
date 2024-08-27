//
//  TernaryBasic.swift
//  Basic
//
//  Created by johyukjun on 8/27/24.
//

import SwiftUI

struct TernaryBasic: View {
    // property
    @State var isStarting: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isStarting.toggle()
            } label: {
                Text("if else button: \(isStarting.description)")
            }

            if (isStarting) {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.red)
                    .frame(width: 200, height: 100)
            }
            else {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.blue)
                    .frame(width: 200, height: 100)
            }
            
            // ternary operation
            Button {
                isStarting.toggle()
            } label: {
                Text("ternary opertion button: \(isStarting.description)")
            }
            
            Text(isStarting ? "red" : "blue")

            if (isStarting) {
                Text("red")
            }
            else {
                Text("blue")
            }
            
            RoundedRectangle(cornerRadius: isStarting ? 25.0 : 0)
                .fill(isStarting ? Color.red : Color.blue)
                .frame(
                    width: isStarting ? 200 : 50,
                    height: isStarting ? 400 : 100
                )
            
            Spacer()
        }
    }
}

#Preview {
    TernaryBasic()
}
