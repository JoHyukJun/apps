//
//  NavigationStack.swift
//  Basic
//
//  Created by johyukjun on 10/14/24.
//

import SwiftUI

struct NavigationStackBasic: View {
    // property
    @State var stack = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stack) {
            NavigationLink("page move", value: 40)
                .navigationDestination(for: Int.self) { value in
                    VStack(spacing: 20) {
                        NavigationLink("page move", value: 100)
                        
                        Text("#2 page")
                        Text("value: \(value)")
                        
                        Button {
                            // move backword
                            //stack.removeLast()
                            // move first
                            stack = .init()
                        } label: {
                            Text("move first page")
                        }
                    }
                    .padding()
                }
                .padding()
        } // NavigationStack
        .padding()
    }
}

#Preview {
    NavigationStackBasic()
}
