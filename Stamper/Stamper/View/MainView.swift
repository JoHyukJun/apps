//
//  MainView.swift
//  Stamper
//
//  Created by johyukjun on 11/9/24.
//

import SwiftUI

struct MainView: View {
    // CoreData Fetch
    @FetchRequest(fetchRequest: Stamp.all()) private var stamps
    
    // ViewModel 연결
    @EnvironmentObject var vm: StampViewModel
    
    // Provider Singleton 연결
    var provider = StampProvider.shared
    
    @State var selectedItem: Stamp?
    @State var stampToEdit: Stamp?
    
    var body: some View {
        NavigationSplitView {
            ZStack {
                if stamps.isEmpty {
                    NoUserView()
                }
                else {
                    List {
                        ForEach(stamps) { stamp in
                            NavigationLink {
                                UserDetailView()
                            } label: {
                                StampRowView(vm: .init(provider: provider, stamp: stamp))
                                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                        // DELETE ACTION
                                        Button {
                                            do {
                                                try provider.delete(stamp: stamp, context: provider.viewContext)
                                            } catch {
                                                print("Error: \(error.localizedDescription)")
                                            }
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                        .tint(.red)
                                    }
                                    .swipeActions(edge: .trailing) {
                                        // UPDATE ACTION
                                    }
                            } // NavigationLink
                        } // ForEach
                        .listRowSeparator(.hidden)
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.accentColor.opacity(0.3))
                                .padding(.vertical, 5)
                        )
                    }
                }
                
            }
            .frame(minWidth: 200)
            .navigationTitle("Coffee Stamp")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        stampToEdit = .empty(context: provider.newContext)
                    } label: {
                        Image(systemName: "plus")
                            .symbolVariant(.circle)
                    }
                }
                
                ToolbarItem(placement: .automatic) {
                    Button {
                        
                    } label: {
                        Image(systemName: "star.fill")
                            .symbolVariant(.circle)
                    }
                }
                
                ToolbarItem(placement: .automatic) {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.up")
                            .symbolVariant(.circle)
                    }
                }
            }
            .sheet(item: $stampToEdit) {
                stampToEdit = nil
            } content: { stamp in
                NavigationStack {
                    CreateUserView(vm: .init(provider: provider, stamp: stamp))                    
                }
            }
        } detail: {
            // NavigationLink 를 눌렀을때 View -> value 값을 넘겨줘야기때문에 생략
        }

    }
}

#Preview {
    MainView()
}
