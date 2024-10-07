//
//  DeviceViewSub.swift
//  Basic
//
//  Created by johyukjun on 10/6/24.
//

import SwiftUI

struct DeviceViewSub: View {
    // property
    let selectedItem: String
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("selected device:")
                    .font(.title)
                
                Text(selectedItem)
                    .font(.headline)
            }
            
            NavigationLink {
                DeviceViewTrd()
            } label: {
                Text("move to next page")
            }

        }
    }
}

#Preview {
    DeviceViewSub(selectedItem: "iphone 12")
}
