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
            orderAscending ? menuote1.updatedAt > menuote2.updatedAt : menuote1.updatedAt < menuote2.updatedAt
        }
    }
    
    @State var memoContentInput: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    // MARK: - HEADER NAVIGATIONLINK
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
                
                // MARK: - NOTE LIST
                //                if (menuotes.isEmpty) {
                //                    ContentUnavailableView("Add new memo", systemImage: "rectangle.and.pencil.and.ellipsis", description: Text("Click the plus button to add a new memo."))
                //                }
                
                List {
                    ForEach(sortedMenuotes) { menuote in
                        NavigationLink {
                            NoteView(menuote: menuote)
                        } label {
                            RowView(menuote: menuote)
                        }
                    }
                } // List
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } // NavigationStack
        .navigationTitle("Menuote")
    }
}
