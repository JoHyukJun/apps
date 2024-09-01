//
//  SheetBasic.swift
//  Basic
//
//  Created by johyukjun on 9/1/24.
//

import SwiftUI

struct SheetBasic: View {
    // property
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            Button {
                showSheet.toggle()
            } label: {
                Text("button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(25)
            }
            .sheet(isPresented: $showSheet) {
                SheetBasic2()
            }
//            .fullScreenCover(isPresented: $showSheet) {
//                SheetBasic2()
//            }
        }
    }
}

#Preview {
    SheetBasic()
}
