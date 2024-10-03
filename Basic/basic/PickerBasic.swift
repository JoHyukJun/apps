//
//  PickerBasic.swift
//  Basic
//
//  Created by johyukjun on 10/3/24.
//

import SwiftUI

struct PickerBasic: View {
    // property
    let typeOfDevice: [String] = ["iPhone", "iPad", "MacBook"]
    
    @State var selectedDevice: Int = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedDevice, label: Text("selected device")) {
                        ForEach(0 ..< typeOfDevice.count, id: \.self) { index in
                            Text(typeOfDevice[index])
                        } // ForEach
                    } // Picker
                    .pickerStyle(.menu)
                    
                    Picker(selection: $selectedDevice, label: Text("selected device")) {
                        ForEach(0 ..< typeOfDevice.count, id: \.self) { index in
                            Text(typeOfDevice[index])
                        } // ForEach
                    } // Picker
                    .pickerStyle(.segmented)
                } // Section
                
                Text("device name \(typeOfDevice[selectedDevice])")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
            } // Form
            .navigationTitle(Text("current device"))
        } // NavigationView
    }
}

#Preview {
    PickerBasic()
}
