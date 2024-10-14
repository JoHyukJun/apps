//
//  ButtonStyleBasic.swift
//  Basic
//
//  Created by johyukjun on 10/13/24.
//

import SwiftUI

struct ButtonStyleBasic: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("General ButtonStyle")
                
                Button {
                    // action
                } label: {
                    Text("plain button style")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.plain)

                Button {
                    // action
                } label: {
                    Text("bordered button style")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.bordered)
                
                Button {
                    // action
                } label: {
                    Text("borderedProminent button style")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                
                Button {
                    // action
                } label: {
                    Text("borderless button style")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderless)
            } // VStack
            .padding()
            
            Divider()
            
            VStack {
                Text("Controlsize button size setting")
                
                Button {
                    // action
                } label: {
                    Text("large controlSize")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                Button {
                    // action
                } label: {
                    Text("regular controlSize")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                
                Button {
                    // action
                } label: {
                    Text("small controlSize")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.small)
                
                Button {
                    // action
                } label: {
                    Text("mini controlSize")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.mini)
            }
            .padding()
        } // ScrollView
    }
}

#Preview {
    ButtonStyleBasic()
}
