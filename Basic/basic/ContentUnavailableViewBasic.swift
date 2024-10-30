//
//  ContentUnavailableViewBasic.swift
//  Basic
//
//  Created by johyukjun on 10/15/24.
//

import SwiftUI

struct ContentUnavailableViewBasic: View {
    
    // Image 와 Text 를 합쳐서 전체 스크린에 표시
    // Content 가 unavailable 한 상태에서 UI 에 Error 표시 할 때 사용
    var body: some View {
        ContentUnavailableView("BAD CONNECTION", systemImage: "wifi.exclamationmark.circle", description: Text("THERE IS NO INTERNET"))
        
        Divider()
        
        ContentUnavailableView {
            Label("Check Again", systemImage: "questionmakr.circle.fill")
        } description: {
            Text("This button has function that remove data forever")
        } actions: {
            HStack(spacing: 30) {
                Button("Cancle", role: .cancel) {
                    // cancle action
                }
                
                Button("Delete", role: .destructive) {
                    // delete action
                }
                .buttonStyle(.borderedProminent)
            }
            .fixedSize()
        }

    }
}

struct ContentUnavailablePaging: View {
    var body: some View {
        TabView {
            ContentUnavailableView("SwiftUI", image: "logo", description: Text("Hello, There!"))
                .padding()
            
            ContentUnavailableView("SwiftUI", image: "logo", description: Text("Hello, There!"))
            
            ContentUnavailableView("SwiftUI", image: "logo", description: Text("Hello, There!"))
        }
    }
}


#Preview {
    ContentUnavailableViewBasic()
}

#Preview("ContentUnavailablePaging") {
    ContentUnavailablePaging()
}
