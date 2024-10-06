//
//  OnAppearBasic.swift
//  Basic
//
//  Created by johyukjun on 10/5/24.
//

import SwiftUI

struct OnAppearBasic: View {
    // property
    @State var noticeText: String = "before onAppear"
    @State var count: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(noticeText)
                Text("\(count)")
                
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 200)
                            .padding()
                        
                        .onAppear {
                                self.count += 1
                            }
                    }
                } // LazyVStack
            } // ScrollView
            .onAppear()
            {
                // dispatchQueue delay event
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    noticeText = "onAppar started"
                }
            }
            .navigationTitle("box count: \(count)")
        } // NavigationView
    }
}

#Preview {
    OnAppearBasic()
}
