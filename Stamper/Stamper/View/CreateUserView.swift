//
//  CreateUserView.swift
//  Stamper
//
//  Created by johyukjun on 11/9/24.
//

import SwiftUI

struct CreateUserView: View {
    @Environment(\.dismiss) private var dismiss
    
    // ViewModel
    @ObservedObject var vm: StampViewModel
    
    var body: some View {
        List {
            Section {
                TextField("Name*", text: $vm.stamp.name)
                
                TextField("Company*", text: $vm.stamp.company)
                
                Toggle("Favorite", isOn: $vm.stamp.isFav)
            } header: {
                Text("GENERAL")
            } footer: {
                Text("* You should fill in field")
            }
            
            Section("Note") {
                TextField("", text: $vm.stamp.notes, axis: .vertical)
            }
        } // List
        .frame(height: 400)
        .scrollContentBackground(.hidden)
        .background(Color.accentColor.opacity(0.3))
        .navigationTitle("New User")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    validate()
                    dismiss()
                } label: {
                    Text("Done")
                }
                .disabled(!vm.stamp.isValid)
            }
            
            ToolbarItem(placement: .automatic) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancle")
                }
            }
        }
    }
}


extension CreateUserView {
    func validate() {
        if vm.stamp.isValid {
            do {
                try vm.viewModelSave()
            } catch {
                print("No Stamp Data")
            }
        }
    }
}
