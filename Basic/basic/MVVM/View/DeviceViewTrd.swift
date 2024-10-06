//
//  DeviceViewTrd.swift
//  Basic
//
//  Created by johyukjun on 10/6/24.
//

import SwiftUI

struct DeviceViewTrd: View {
    // property
    // @StateObejct 에서 선언한 ViewModel 을 @EnviromentObject 를 통해 가져오기
    @EnvironmentObject var deviceViewModel: DeviceViewModel
    
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    VStack(spacing: 20) {
                        ForEach(deviceViewModel.devices) { device in
                            Text(device.name)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DeviceViewTrd()
        .environmentObject(DeviceViewModel())
}
