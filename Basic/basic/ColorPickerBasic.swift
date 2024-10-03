//
//  ColorPickerBasic.swift
//  Basic
//
//  Created by johyukjun on 10/3/24.
//

import SwiftUI

struct ColorPickerBasic: View {
    // property
    @State var bgColor: Color = .red
    
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            
            ColorPicker(selection: $bgColor, supportsOpacity: true) {
                Text("Select Color")
            }
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .foregroundColor(.white)
            .font(.headline)
            .padding()
        } // ZStack
    }
}

#Preview {
    ColorPickerBasic()
}
