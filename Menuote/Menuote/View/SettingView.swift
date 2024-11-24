//
//  SettingView.swift
//  Menuote
//
//  Created by johyukjun on 11/12/24.
//

import SwiftUI

struct SettingView: View {
    let typeOfAppSize: [String] = ["X", "M", "L"]
    
    @Binding var appSize: Int
    
    var body: some View {
        VStack {
            Section {
                Picker(selection: $appSize) {
                    ForEach(0 ..< typeOfAppSize.count, id: \.self) { idx in
                        Text(typeOfAppSize[idx])
                    }
                } label: {
                    Text("App Size")
                }
            } // Section
            
            AppInfoView()
        }
        .frame(height: 400)
        .padding()
    }
}
