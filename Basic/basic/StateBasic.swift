//
//  StateBasic.swift
//  Basic
//
//  Created by johyukjun on 8/25/24.
//

import SwiftUI

struct StateBasic: View {
    // property
    @State var backgroundColor: Color = Color.green
    @State var myTitle: String = "non click"
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            // content
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                
                Text("count: \(count)")
                
                HStack(spacing: 20) {
                    Button {
                        // action
                        self.backgroundColor = .red
                        self.myTitle = "increase button click"
                        self.count += 1
                    } label: {
                        Text("increase button")
                    }

                    Button {
                        // action
                        backgroundColor = .blue
                        myTitle = "decrease button click"
                        count -= 1
                    } label: {
                        Text("decrease button")
                    }

                }
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    StateBasic()
}
