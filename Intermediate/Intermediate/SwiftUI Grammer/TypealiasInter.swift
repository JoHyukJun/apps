//
//  TypealiasInter.swift
//  Intermediate
//
//  Created by johyukjun on 11/1/24.
//

import SwiftUI


// MARK: - MODEL
struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

//struct Model {
//    let title: String
//    let director: String
//    let count: Int
//}

// typealias 를 사용해서 MovieModel 을 reference 해서 Model 에 그대로 사용
typealias Model = MovieModel

// MARK: - VIEW
struct TypealiasInter: View {
    @State var item: MovieModel = MovieModel(title: "title", director: "derek", count: 10)
    @State var item2: Model = Model(title: "sub", director: "karma", count: 4)
    
    var body: some View {
        VStack(spacing: 20) {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
            
            Divider()
            
            Text(item2.title)
            Text(item2.director)
            Text("\(item2.count)")
        }
    }
}

#Preview {
    TypealiasInter()
}
