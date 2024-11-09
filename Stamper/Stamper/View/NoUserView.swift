//
//  NoUserView.swift
//  Stamper
//
//  Created by johyukjun on 11/9/24.
//

import SwiftUI

struct NoUserView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("No User")
                .font(.largeTitle.bold())
            
            Text("Add new user!")
                .font(.callout)
        }
    }
}

#Preview {
    NoUserView()
}
