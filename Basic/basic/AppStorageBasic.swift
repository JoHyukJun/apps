//
//  AppStorageBasic.swift
//  Basic
//
//  Created by johyukjun on 10/6/24.
//

import SwiftUI

struct AppStorageBasic: View {
    // property
    @State var generalName: String?
    
    // app storage 를 사용하면 앱을 다시 열때 키에서 이름을 가져옴
    @AppStorage("name") var appStorageName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("@State save")
                    .font(.headline)
                
                Text(generalName ?? "what's your name?")
                
                Button {
                    // action
                    generalName = "derek"
                } label: {
                    Text("load")
                }
            } // VStack
            .padding()
            .border(.red)
            
            VStack {
                Text("@AppStorage save")
                    .font(.headline)
                
                Text(appStorageName ?? "what's your name?")
                
                Button {
                    // action
                    appStorageName = "derek"
                } label: {
                    Text("load")
                }
            } // VStack
            .padding()
            .border(.blue)
        } // VStack
        .padding()
        
    }
}

#Preview {
    AppStorageBasic()
}
