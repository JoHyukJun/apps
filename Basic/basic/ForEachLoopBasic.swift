//
//  ForEachLoopBasic.swift
//  Basic
//
//  Created by johyukjun on 8/24/24.
//

import SwiftUI

struct ForEachLoopBasic: View {
    var data: [String] = ["hello", "there", "karma"]
    
    var body: some View {
        VStack {
            ForEach(0..<10) { index in
                HStack {
                    Circle()
                        .frame(width: 20, height: 20)
                    
                    Text("index number: \(index)")
                }
            }
            
            Divider()
            
            ForEach(data, id: \.self)  { item in
                Text(item)
            }
        }
    }
}

#Preview {
    ForEachLoopBasic()
}
