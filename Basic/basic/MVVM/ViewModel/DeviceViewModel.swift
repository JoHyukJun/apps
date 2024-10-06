//
//  DeviceViewModel.swift
//  Basic
//
//  Created by johyukjun on 10/6/24.
//

import Foundation


class DeviceViewModel: ObservableObject {
    // property
    @Published var devices: [DeviceModel] = []
    
    init() {
        getData()
    }
    
    // func
    func getData() {
        let device1 = DeviceModel(name: "iPhone 12")
        let device2 = DeviceModel(name: "iPhone 12 Pro")
        let device3 = DeviceModel(name: "iPhone 12 Pro Max")
        let device4 = DeviceModel(name: "iPhone SE")
        
        self.devices.append(device1)
        self.devices.append(device2)
        self.devices.append(device3)
        self.devices.append(device4)
    }
}
