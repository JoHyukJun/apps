//
//  InitEnumBasic.swift
//  Basic
//
//  Created by johyukjun on 8/15/24.
//

import SwiftUI

struct InitEnumBasic: View {
    // var declare
    let backgroundColor: Color
    let count: Int
    let title: String
    
    // enum
    enum Fruit {
        case apple
        case orange
        case melon
    }
    
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        if (fruit == .apple) {
            self.title = "apple"
            self.backgroundColor = .red
        }
        else if (fruit == .orange) {
            self.title = "orange"
            self.backgroundColor = .orange
        }
        else {
            self.title = "melon"
            self.backgroundColor = .green
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

#Preview {
    HStack {
        InitEnumBasic(count: 100, fruit: .apple)
        InitEnumBasic(count: 42, fruit: .orange)
        InitEnumBasic(count: 20, fruit: .melon)
    }
}
