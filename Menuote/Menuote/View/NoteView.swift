//
//  NoteView.swift
//  Menuote
//
//  Created by johyukjun on 11/14/24.
//

import SwiftUI
import SwiftData


struct NoteView: View {
    var menuote: MenuoteModel? = nil
    
    var newMenuote: Bool {
        self.menuote == nil ? true : false
    }
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var mTitle: String = ""
    @State private var mContent: String = ""
    @State private var mCreatedAt: Date = Date()
    @State private var mUpdatedAt: Date = Date()
    @State private var mIsPinned: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Label {
                TextField("Input Title", text: $mTitle)
            } icon: {
                Image(systemName: "pencil.circle.fill")
            }
            
            TextEditor(text: $mContent)
                .frame(width: 200, height: 200)
                .padding()
                .textEditorStyle(.plain)
                .onChange(of: mContent) { oldValue, newValue in
                    if (oldValue != newValue) {
                        if newMenuote {
                            let newMenuote = MenuoteModel(title: mTitle, content: mContent, createdAt: mCreatedAt, updatedAt: mUpdatedAt, isPinned: mIsPinned)
                            
                            modelContext.insert(newMenuote)
                        }
                    }
                }
            
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: 500)
        .padding()
    }
}

#Preview {
    NoteView()
}
