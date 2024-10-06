//
//  DeviceViewMain.swift
//  Basic
//
//  Created by johyukjun on 10/6/24.
//

import SwiftUI

struct DeviceViewMain: View {
    @StateObject var viewModel: DeviceViewModel = DeviceViewModel()
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.devices) { device in
                    NavigationLink {
                        // destination
                        DeviceViewSub(selectedItem: device.name)
                    } label: {
                        Text(device.name)
                    }

                } // ForEach
            } // List
        } // NavigationView
        .environmentObject(viewModel)
    }
}

#Preview {
    DeviceViewMain()
}
