//
//  ColorBasic.swift
//  Basic
//
//  Created by johyukjun on 8/4/24.
//

import SwiftUI

struct ColorBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            // basic color
            Text("basic color")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.cyan)
                .frame(width: 200, height: 100, alignment: .center)
            
            // primary color
            Text("primary color")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.primary)
                .frame(width: 200, height: 100, alignment: .center)
            
            // primary color
            Text("secondary color")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.secondary)
                .frame(width: 200, height: 100, alignment: .center)
            
            // system color
            Text("system color")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(.secondarySystemFill))
                .frame(width: 200, height: 100, alignment: .center)
            
            // custom color
            Text("custom color")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("CustomColor"))
                .frame(width: 200, height: 100, alignment: .center)
        }
    }
}

#Preview {
    ColorBasic()
//        .preferredColorScheme(.light)
}
