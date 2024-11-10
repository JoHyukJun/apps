//
//  PreviewSwiftData.swift
//  Intermediate
//
//  Created by johyukjun on 11/10/24.
//

import SwiftUI
import SwiftData


struct PreviewSwiftDataView: View {
    @Query private var people2: [PreviewModel]
    
    var body: some View {
        VStack(spacing: 20) {
            List(people2, id: \.self) { person in
                HStack {
                    Text(person.name)
                    
                    Spacer()
                    
                    Text("\(person.age)")
                        .font(.caption)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    PreviewSwiftDataView()
        .modelContainer(PreviewModel.previewData)
}
