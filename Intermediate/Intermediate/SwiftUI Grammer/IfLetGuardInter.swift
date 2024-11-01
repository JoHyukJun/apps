//
//  IfLetGuardInter.swift
//  Intermediate
//
//  Created by johyukjun on 10/31/24.
//

import SwiftUI

struct IfLetGuardInter: View {
    // MARK: - PROPERTY
    @State var displayText: String? = nil
    @State var currentUserId: String? = "delmar"
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Safe Code Practice")
//                Text(displayText)
//                    .font(.title2)
                
                // Optinal Unwrapping
                // 1. if let
                if let text = displayText { // displayText is True -> String value
                    Text(text)
                        .font(.title2)
                }
                else { // displayText is False -> nil
                    ProgressView()
                }
                
                // 2. guard
                
                Spacer()
            } // VStack
            .navigationTitle("Optional Binding")
            .onAppear {
                loadData2()
            }
        } // NavigationView
    }
    
    // MARK: - FUNCTION
    func loadData() {
        // currentUserId check -> String ? nil ?
        if let userId = currentUserId {
            // exec after 3 sec
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "Loaded Data: \(userId)"
            }
        }
        else {
            displayText = "Error, login failed"
        }
    }
    
    func loadData2() {
        // guard 문은 else (nil) 먼저 처리 후 return 처리를 해줘야 함
        guard let userId = currentUserId else {
            displayText = "Error, login failed"
            
            return
        }
        
        // exec after 3 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "Loaded Data: \(userId)"
        }
    }
}

// MARK: - PREVIEW
#Preview {
    IfLetGuardInter()
}
