//
//  ExtractViewBasic.swift
//  Basic
//
//  Created by johyukjun on 8/25/24.
//

import SwiftUI

struct ExtractViewBasic: View {
    // property
    @State var bacgroundColor: Color = Color.pink
    
    var body: some View {
        ZStack {
            bacgroundColor
                .ignoresSafeArea()
            
            contentLayer
        }
    }
    
    // content
    var contentLayer: some View {
        VStack {
            Text("Extract View Example")
                .font(.largeTitle)
            
            Button {
                buttonPressed()
            } label: {
                Text("change background color")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
        }
    }
    
    // function
    func buttonPressed() {
        bacgroundColor = .yellow
    }
}

#Preview {
    ExtractViewBasic()
}
