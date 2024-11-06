//
//  ViewModifierInter.swift
//  Intermediate
//
//  Created by johyukjun on 11/2/24.
//

import SwiftUI


struct DefaultButtonModifier: ViewModifier {
    let backgroundColor: Color
    
    // ViewModifier 에 body 가 들어가는데 some View 를 return 하는 함수형태의 body
    func body(content: Content) -> some View {
        content
            .font(.title)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .padding()
            .background(backgroundColor)
    }
}

struct ViewModifierInter: View {
    var body: some View {
        VStack(spacing: 20) {
            // general button
            Button {
                
            } label: {
                Text("ViewModifier Practice 1")
                    .withDefaultButtonFormat()
            }
            
            Button {
                
            } label: {
                Text("ViewModifier Practice 2")
                    .withDefaultButtonFormat(backgroundColor: .yellow)
            }
            
            Button {
                
            } label: {
                Text("ViewModifier Practice 3")
                    .withDefaultButtonFormat()            }
        }
    }
}

extension View {
    func withDefaultButtonFormat(backgroundColor: Color = Color.green) -> some View {
        self.modifier(DefaultButtonModifier(backgroundColor: backgroundColor))
    }
}

#Preview {
    ViewModifierInter()
}
