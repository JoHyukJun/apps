//
//  BackgroundMaterialsBasic.swift
//  Basic
//
//  Created by johyukjun on 10/13/24.
//

import SwiftUI

struct BackgroundMaterialsBasic: View {
    // property
    let url = URL(string: "https://picsum.photos/1000")
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                
                Spacer()
                
                Text("Material Background Example")
                    .font(.headline)
                
                Spacer()
            } // VStack
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
        } // VStack
        .background(
            AsyncImage(url: url) { Image in
                Image
            } placeholder: {
                ProgressView()
            }
        )
    }
}

#Preview {
    BackgroundMaterialsBasic()
}
