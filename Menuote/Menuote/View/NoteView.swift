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
   
    @Binding var appSize: Int
    private var textEditorSize: CGFloat {
        if (appSize == 0) {
            return 150
        }
        else if (appSize == 1) {
            return 200
        }
        else if (appSize == 2) {
            return 300
        }
        else {
            return 200
        }
    }
    
    private var vstackSize: CGFloat {
        if (appSize == 0) {
            return 200
        }
        else if (appSize == 1) {
            return 300
        }
        else if (appSize == 2) {
            return 400
        }
        else {
            return 300
        }
    }
    
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
    
    var body: some View {
        Form {
            VStack(spacing: 10) {
                Label {
                    TextField("", text: $mTitle)
                        .textFieldStyle(.plain)
                        .font(.title2)
                } icon: {
                    Button {
                        mIsPinned.toggle()
                    } label: {
                        Image(systemName: mIsPinned ? "pin.fill" : "pin")
                    }
                }
                
                
                TextEditor(text: $mContent)
                    .frame(height: textEditorSize)
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
            .frame(height: vstackSize)
            .frame( maxWidth: .infinity, maxHeight: .infinity)
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
