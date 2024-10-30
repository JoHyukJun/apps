//
//  NavigationSplitViewBasic.swift
//  Basic
//
//  Created by johyukjun on 10/15/24.
//

import SwiftUI

struct NavigationSplitViewBasic: View {
    var body: some View {
        NavigationSplitView {
            // sidebar
            Text("Sidebar")
                .navigationTitle("NavigationSplitView")
        } detail: {
            // detail
            Text("Detail")
        }

    }
}

// MARK: - macos not supported
//struct NavigationSplitViewVisibility: View {
//    // property
//    @State private var visibility = NavigationSplitViewVisibility.all
//    
//    var body: some View {
//        NavigationSplitView(columnVisibility: $visibility) {
//            Text("Sidebar")
//        } detail: {
//            Text("Detail")
//            
//            Button("Show Sidebar") {
//                visibility = .all
//            }
//        }
//
//    }
//}

struct NavigationSplitViewMulti: View {
    var body: some View {
        NavigationSplitView {
            Text("Sidevar")
//                .navigationSplitViewColumnWidth(120)
        } content: {
            Text("Content")
//                .navigationSplitViewColumnWidth(min: 900, ideal: 1000)
        } detail: {
            Text("Detail")
//                .navigationSplitViewColumnWidth(200)
        }
        // .automatic: Width 설정 한 값에 크기 맞추기
        // .balanced: Sidebar 와 Content 가 보이게 되면 Detail 부분이 줄어듬
        // .prominentDetail: Detail 부분이 main 에 위치하게 됨
        .navigationSplitViewStyle(.automatic)
    }
}

#Preview {
    NavigationSplitViewBasic()
}

#Preview("NavigationSplitViewMulti") {
    NavigationSplitViewMulti()
}
