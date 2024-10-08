//
//  CreditView.swift
//  Musiqueue
//
//  Created by johyukjun on 10/8/24.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack {
            Text("""
    Copyright Unlucky Strike
    All right reserved
""")
            .font(.footnote)
            .multilineTextAlignment(.center)
            .padding()
            .opacity(0.5)
        }
    }
}

#Preview {
    CreditView()
}
