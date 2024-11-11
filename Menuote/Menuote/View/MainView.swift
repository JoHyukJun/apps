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
    
    @State var memoContent: String = ""
    
    var body: some View {
        VStack {
            TabView {
                ForEach(menuotes) { menuote in
                    
                }
            }
            TextEditor(text: $memoContent)
                .frame(width: 200, height: 200)
                .padding()
        }
    }
}

#Preview {
    MainView()
}
