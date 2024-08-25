//
//  BindingChild.swift
//  Basic
//
//  Created by johyukjun on 8/25/24.
//

import SwiftUI

struct BindingChild: View {
    // property
    @State var buttonColor: Color = Color.blue
    @Binding var backgroundColor: Color
    @Binding var title: String
    
    var body: some View {
        Button {
            // action
            backgroundColor = Color.orange
            buttonColor = Color.pink
            title = "binding child view"
        } label: {
            Text("child view")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        }

    }
}

#Preview {
    BindingChild(backgroundColor: .constant(Color.orange), title: .constant("binding child"))
        .previewLayout(.sizeThatFits)
}
