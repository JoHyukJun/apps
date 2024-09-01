//
//  TransitionBasic.swift
//  Basic
//
//  Created by johyukjun on 9/1/24.
//

import SwiftUI

struct TransitionBasic: View {
    // property
    @State var showTransition: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button {
                    withAnimation(.easeInOut) {
                        showTransition.toggle()
                    }
                } label: {
                    Text("button")
                }
                
                Spacer()
                
                if (showTransition) {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(height: 200)
                        .opacity(showTransition ? 1.0 : 0.0)
                    // move transition
                    //    .transition(.move(edge: .bottom))
                    // opacity transition
                    //    .transition(.opacity)
                    // scale transition
                    //    .transition(.scale)
                    // asymmetric transition
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .top)))
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    TransitionBasic()
}
