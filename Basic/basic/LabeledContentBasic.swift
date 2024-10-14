//
//  LabeledContentBasic.swift
//  Basic
//
//  Created by johyukjun on 10/14/24.
//

import SwiftUI

struct LabeledContentBasic: View {
    @State var isAlert: Bool = false
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("LabeledContent")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)
            
            LabeledContent("title", value: "value")
            
            LabeledContent("title") {
                Label("camera", systemImage: "camera")
            }
            
            LabeledContent("percent", value: 50, format: .percent)
            
            LabeledContent("price", value: 400000, format: .currency(code: "KRW"))
            
            LabeledContent {
                Text("value custom")
                    .font(.title.bold())
                    .foregroundStyle(.red)
            } label: {
                Text("title")
                    .fontWeight(.bold)
            }
            
            List {
                LabeledContent("title") {
                    Label("camera", systemImage: "camera")
                }
                
                LabeledContent("percent", value: 50, format: .percent)
                
                LabeledContent("price", value: 400000, format: .currency(code: "USD"))
                
                LabeledContent("settings") {
                    GroupBox {
                        Toggle("alert", isOn: $isAlert)
                        Toggle("present", isOn: $isPresented)
                    }
                    .padding(.horizontal)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    LabeledContentBasic()
}
