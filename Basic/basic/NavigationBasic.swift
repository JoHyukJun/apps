//
//  NavigationBasic.swift
//  Basic
//
//  Created by johyukjun on 9/8/24.
//

import SwiftUI

struct NavigationBasic: View {
    // property
    @State var showSheet: Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    // destination
                    NavigationViewBasic()
                } label: {
                    Text("move second navagation")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            } // VStack
            // navigationTitle - page title
            .navigationTitle("title")
            .navigationBarBackButtonHidden(false)
        } // NavigationView
    }
}

#Preview {
    NavigationBasic()
}
