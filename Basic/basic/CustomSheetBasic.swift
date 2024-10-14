//
//  CustomSheetBasic.swift
//  Basic
//
//  Created by johyukjun on 10/14/24.
//

import SwiftUI

struct CustomSheetBasic: View {
    // property
    @State var showSheet: Bool = false
    
    var body: some View {
        Button {
            showSheet.toggle()
        } label: {
            Text("show sheet")
                .font(.title)
        }
        .sheet(isPresented: $showSheet) {
            Text("Custom size sheet")
                .presentationDetents([.small, .medium, .large])
                .presentationDragIndicator(.visible)
        }
    }
}

// Sheet Size Custon
extension PresentationDetent {
    static let small = Self.height(100)
}

#Preview {
    CustomSheetBasic()
}
