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
    
    @State private var orderAscending: Bool = true
    private var sortedMenuotes: [MenuoteModel] {
        menuotes.sorted { menuote1, menuote2 in
            orderAscending ? menuote1.updatedAt < menuote2.updatedAt : menuote1.updatedAt > menuote2.updatedAt
        }
    }
    
    @State var memoContentInput: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
//                if (menuotes.isEmpty) {
//                    ContentUnavailableView("Add new memo", systemImage: "rectangle.and.pencil.and.ellipsis", description: Text("Click the plus button to add a new memo."))
//                }
                
                HStack {
                    NavigationLink {
                        SettingView()
                    } label: {
                        Image(systemName: "gear")
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        NoteView()
                    } label: {
                        Image(systemName: "note.text.badge.plus")
                    }
                }
                .padding()
                
                
                List {
                    ForEach(sortedMenuotes) { menuote in
                        Text(menuote.title)
                    }
                }
                
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
                .scrollTargetBehavior(.paging)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        // ACTION
                    } label: {
                        Image(systemName: "plus.app.fill")
                    }
                }
            } // toolbar
        }
        .navigationTitle("Menuote")
    }
}
