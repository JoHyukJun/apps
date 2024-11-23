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
    
    @State private var showAlert: Bool = false
    @State private var selectedMenuote: MenuoteModel?
    @State private var orderAscending: Bool = true
    private var sortedMenuotes: [MenuoteModel] {
        menuotes.sorted { menuote1, menuote2 in
            if (orderAscending) {
                if (menuote1.isPinned != menuote2.isPinned) {
                    return !menuote2.isPinned
                }
                
                return menuote1.updatedAt > menuote2.updatedAt
                
            }
            else {
                return menuote1.updatedAt < menuote2.updatedAt
            }
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
                if (menuotes.isEmpty) {
                    ContentUnavailableView("Add new memo", systemImage: "rectangle.and.pencil.and.ellipsis", description: Text("Click the plus button to add a new memo."))
                }
                else {
                    List {
                        ForEach(sortedMenuotes) { menuote in
                            NavigationLink {
                                NoteView(menuote: menuote)
                            } label: {
                                RowView(menuote: menuote)
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        Button {
                                            // index set
                                            selectedMenuote = menuote
                                            
                                            guard let selectedMenuote = selectedMenuote else { return }
                                            modelContext.delete(selectedMenuote)
                                        } label: {
                                            Text("Delete")
                                        }
                                        .tint(.red)
                                    }
                            }
                        }
                    } // List                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } // NavigationStack
        .navigationTitle("Menuote")    }
}
