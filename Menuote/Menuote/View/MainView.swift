//
//  MainView.swift
//  Menuote
//
//  Created by johyukjun on 11/11/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var menuotes: [MenuoteModel]
    
    @State var memoContentInput: String = ""
    
    var body: some View {
        VStack {
            HStack {
                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(1..<10) { menuote in
                        TextEditor(text: $memoContentInput)
                            .frame(width: 200, height: 200)
                            .padding()
                            .textEditorStyle(.plain)
                            .onChange(of: memoContentInput) { oldValue, newValue in
                                print("old" + oldValue)
                                print("new" + newValue)
                            }
                    }
                }
                .frame(height: 200)
                .scrollTargetBehavior(.paging)
                .padding()
            }
        }
    }
}
