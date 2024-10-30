//
//  SymbolEffectBasic.swift
//  Basic
//
//  Created by johyukjun on 10/15/24.
//

import SwiftUI

struct SymbolEffectBasic: View {
    //property
    @State private var startAnimation: Bool = false
    
    var body: some View {
        List {
            Label(
                title: { Text("variableColor") },
                icon: {
                    Image(systemName: "airplayaudio")
                        .foregroundStyle(.mint)
                        .symbolEffect(.variableColor)
                }
            )
            
            Label(
                title: { Text("Pulse") },
                icon: {
                    Image(systemName: "airplayaudio.badge.exclamationmark")
                        .foregroundStyle(.red, .mint)
                        .symbolEffect(.pulse)
                }
            )
            
            Label(
                title: { Text("button") },
                icon: {
                    Image(systemName: "lightbulb.max.fill")
                        .foregroundStyle(.mint)
                        .symbolEffect(.bounce, options: .repeating.repeat(2), value: startAnimation)
                }
            )
            
            Button("Start Animation") {
                startAnimation.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .font(.title)
        .listStyle(.plain)
    }
}

#Preview {
    SymbolEffectBasic()
}
