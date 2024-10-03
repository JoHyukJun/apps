//
//  ToggleBasic.swift
//  Basic
//
//  Created by johyukjun on 10/3/24.
//

import SwiftUI

struct ToggleBasic: View {
    // property
    @State var toggleIson: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("login state")
                Text(toggleIson ? "on" : "off")
            } // HStack
            
            Toggle(isOn: $toggleIson) {
                Text("log in")
            } // Toggle
            .toggleStyle(SwitchToggleStyle(tint: Color.red))
            
            Spacer()
        } // VStack
        .padding(.horizontal, 100)
    }
}

#Preview {
    ToggleBasic()
}
