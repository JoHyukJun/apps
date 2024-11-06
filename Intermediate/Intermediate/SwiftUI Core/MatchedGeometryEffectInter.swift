//
//  MatchedGeometryEffectInter.swift
//  Intermediate
//
//  Created by johyukjun on 11/2/24.
//

import SwiftUI

struct MatchedGeometryEffectInter: View {
    @State private var isToggled: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !isToggled {
                RoundedRectangle(cornerRadius: 20)
                    .matchedGeometryEffect(id: "rect", in: namespace)
                    .frame(width: 100, height: 100)
            }
            
//                .offset(y: isToggled ? (NSScreen.main?.visibleFrame.size.height)! * 0.7 : 0)
            
            Spacer()
            
            if isToggled {
                RoundedRectangle(cornerRadius: 20)
                    .matchedGeometryEffect(id: "rect", in: namespace)
                    .frame(width: 200, height: 100)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            withAnimation(.spring()) {
                isToggled.toggle()
            }
        }
    }
}

struct MatchedGeometryEffectInter2: View {
    let categories: [String] = ["Apple", "Banana", "Orange", "Pear", "Strawberry"]
    @State private var selectedItem: String = ""
    @Namespace private var namespace
    
    var body: some View {
        ScrollView {
            HStack {
                ForEach(categories, id: \.self) { category in
                    ZStack {
                        if selectedItem == category {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green)
                                .matchedGeometryEffect(id: "cat", in: namespace)
                                .frame(width: 40, height: 2)
                                .offset(y: 10)
                        }
                        
                        Text(category)
                            .foregroundStyle(selectedItem == category ? .green : .white)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedItem = category
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MatchedGeometryEffectInter()
}

#Preview("MatchedGeometryEffectInter2") {
    MatchedGeometryEffectInter2()
}
