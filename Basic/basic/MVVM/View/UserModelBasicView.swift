//
//  UserModelBasicView.swift
//  Basic
//
//  Created by johyukjun on 10/6/24.
//

import SwiftUI

struct UserModelBasicView: View {
    // property
    @State var users: [UserModel] = [
        UserModel(displayName: "derek", userName: "z", followerCount: 42, isChecked: true),
        UserModel(displayName: "karam", userName: "c", followerCount: 42, isChecked: false),
        UserModel(displayName: "palam", userName: "d", followerCount: 42, isChecked: false),
        UserModel(displayName: "grandalf", userName: "f", followerCount: 42, isChecked: true)
    ]
    
    
    var body: some View {
        VStack {
            List {
                ForEach(users) {user in
                    HStack(spacing: 20) {
                        // Text(user.id)
                        Circle()
                            .frame(width: 35, height: 35)
                        
                        VStack (alignment: .leading, spacing: 5) {
                            Text(user.displayName)
                                .font(.headline)
                            
                            Text("@\(user.userName)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        } // VStack
                        
                        Spacer()
                        
                        if user.isChecked {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            
                            Text("followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                        } // VStack
                        .padding()
                    } // HStack
                } // ForEach
            } // List
        } // VStack
    }
}

#Preview {
    UserModelBasicView()
}
