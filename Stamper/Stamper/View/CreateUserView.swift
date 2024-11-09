//
//  CreateUserView.swift
//  Stamper
//
//  Created by johyukjun on 11/9/24.
//

import SwiftUI

struct CreateUserView: View {
    @State var testText: String = "Test"
    @State var testBool: Bool = false
    
    var body: some View {
        List {
            Section {
                TextField("Name*", text: $testText)
                
                TextField("Company*", text: $testText)
                
                Toggle("Favorite", isOn: $testBool)
            } header: {
                Text("GENERAL")
            } footer: {
                Text("* You should fill in field")
            }
            
            Section("Note") {
                TextField("", text: $testText, axis: .vertical)
            }
        } // List
        .scrollContentBackground(.hidden)
        .background(Color.accentColor.opacity(0.3))
        .navigationTitle("New User")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    
                } label: {
                    Text("Done")
                }
            }
            
            ToolbarItem(placement: .automatic) {
                Button {
                    
                } label: {
                    Text("Cancle")
                }
            }
        }
    }
}

#Preview {
    CreateUserView()
}
