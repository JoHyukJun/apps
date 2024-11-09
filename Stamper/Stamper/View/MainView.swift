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
    
    var body: some View {
        NavigationSplitView {
            ZStack {
                List {
                    ForEach(1..<10, id: \.self) { idx in
                        NavigationLink {
                            UserDetailView()
                        } label: {
                            StampRowView(index: idx)
                                .swipeActions(edge: .leading) {
                                    // DELETE ACTION
                                }
                                .swipeActions(edge: .trailing) {
                                    // UPDATE ACTION
                                }
                        } // NavigationLink
                    }
                }
            }
            .frame(minWidth: 200, maxWidth: .infinity)
            .navigationTitle("Coffee Stamp")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        
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
        } detail: {
            // NavigationLink 를 눌렀을때 View -> value 값을 넘겨줘야기때문에 생략
        }

    }
}

#Preview {
    MainView()
}
