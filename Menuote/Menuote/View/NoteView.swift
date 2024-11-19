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
    
    var isNewMenuote: Bool {
        self.menuote == nil ? true : false
    }
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var mTitle: String = ""
    @State private var mContent: String = ""
    @State private var mCreatedAt: Date = Date()
    @State private var mUpdatedAt: Date = Date()
    @State private var mIsPinned: Bool = false
    
    @State private var isNew: Bool = false
    
    var body: some View {
        Form {
            VStack(spacing: 10) {
                Label {
                    TextField("Title", text: $mTitle)
                } icon: {
                    Image(systemName: "pencil.circle.fill")
                }
                
                TextEditor(text: $mContent)
                    .frame(width: 200, height: 200)
                    .padding()
                    .textEditorStyle(.plain)
                
                HStack(spacing: 10) {
                    Button {
                        if isNewMenuote {
                            let newMenuote = MenuoteModel(title: mTitle, content: mContent, createdAt: mCreatedAt, updatedAt: mUpdatedAt, isPinned: mIsPinned)
                            
                            modelContext.insert(newMenuote)
                        }
                        else {
                            menuote?.title = mTitle
                            menuote?.content = mContent
                            menuote?.updatedAt = mUpdatedAt
                            menuote?.isPinned = mIsPinned
                        }
                        
                        dismiss()
                    } label: {
                        Text(isNewMenuote ? "Create" : "Update")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal)
                    .disabled(mContent.isEmpty)
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancle")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal)
                    .tint(.red)
                }
            }
            .frame( maxWidth: .infinity, maxHeight: .infinity)
            .frame(height: 500)
            .padding()
        }
        .task {
            if let menuote {
                mTitle = menuote.title
                mContent = menuote.content
                mIsPinned = menuote.isPinned
            }
            else {
                mIsPinned = menuote?.isPinned ?? false
            }
        }
    }
}
