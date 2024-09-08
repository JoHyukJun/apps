//
//  NavigationViewBasic.swift
//  Basic
//
//  Created by johyukjun on 9/8/24.
//

import SwiftUI

struct NavigationViewBasic: View {
    // property
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
                .navigationTitle("second page")
            
            VStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("move previous page")
                        .foregroundColor(.green)
                        .font(.headline)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                }

                NavigationLink {
                    // destination
                    ZStack {
                        Color.red.ignoresSafeArea()
                        Text("third page")
                            .font(.largeTitle)
                    }
                } label: {
                    Text("move third page")
                        .foregroundColor(.green)
                        .font(.headline)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                }

            }
        }
    }
}

#Preview {
    NavigationView {
        NavigationBasic()
    }
}
