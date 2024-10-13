//
//  AsyncImageBasic.swift
//  Basic
//
//  Created by johyukjun on 10/13/24.
//

import SwiftUI

struct AsyncImageBasic: View {
    // property
    let url = URL(string: "https://picsum.photos/200")
    
    var body: some View {
        VStack(spacing: 20) {
            // ProgressView()
            Text("General AsyncImage Example")
                .font(.headline)
            
            AsyncImage(url: url) { Image in
                Image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
            
            Divider()
            
            /*
             switch case
             case empty -> none image
             case success -> image load success
             case failure -> image load fail
             */
            Text("Async Image using switch case")
                .font(.headline)
            
            AsyncImage(url: url) { raw in
                switch raw {
                case .empty:
                    ProgressView()
                    
                case .success(let image):
                    image
                    
                case .failure:
                    Text("Image Load Fail")
                    
                default:
                    Text("Image Load Fail")
                }
            }
        } // VStack
    }
}

#Preview {
    AsyncImageBasic()
}
