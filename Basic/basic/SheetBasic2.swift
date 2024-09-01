//
//  SheetBasic2.swift
//  Basic
//
//  Created by johyukjun on 9/1/24.
//

import SwiftUI

struct SheetBasic2: View {
    // property
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // background
            Color.red.ignoresSafeArea()
            
            // contents
            Button {
                // close sheet
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
            }

        }
    }
}

#Preview {
    SheetBasic2()
}
