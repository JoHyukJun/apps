//
//  UserModel.swift
//  Basic
//
//  Created by johyukjun on 10/6/24.
//

import Foundation


struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isChecked: Bool 
}
