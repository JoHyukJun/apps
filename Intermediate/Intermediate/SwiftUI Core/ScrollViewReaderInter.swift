//
//  ScrollViewReaderInter.swift
//  Intermediate
//
//  Created by johyukjun on 11/2/24.
//

import SwiftUI

struct ScrollViewReaderInter: View {
    @State var scrollToIdx: Int = 0
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            TextField("input box number", text: $textFieldText)
                .font(.headline)
                .frame(height: 35)
                .padding(.horizontal)
            
            Button {
                withAnimation(.spring()) {
//                    let idx = Int(textFieldText) ?? 0
                    // idx 가 optional 값이므로 guard let 구문으로 unwrapping
                    guard let index = Int(textFieldText) else {
                        return showAlert.toggle()
                    }
                    scrollToIdx = index
                }
            } label: {
                Text("move")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid input"), message: Text("Check input value again"), dismissButton: .default(Text("close")))
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                // proxy 라는 뜻은 ScrollView 사이즈를 읽는 크기
                // proxy 로 각각의 아이템 위치를 확인
                ScrollViewReader { proxy in
//                    Button {
//                        withAnimation(.spring()) {
//                            proxy.scrollTo(30, anchor: .top)
//                        }
//                    } label: {
//                        Text("move 30 index box")
//                    }
                    
                    ForEach(1..<51) { idx in
                        Text("BOX \(idx)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.green.opacity(0.5))
                            .shadow(radius: 10)
                            .padding()
                        // 각각 idx 에 id 값을 주어서 proxy 가 id 가 어디인지 알기 위한 id 값 설정
                            .id(idx)
                    } // ForEach
                    .onChange(of: scrollToIdx) { oldValue, newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                } // ScrollViewReader
                .padding()
            } // ScrollView
        } // VStack
    }
}

#Preview {
    ScrollViewReaderInter()
}
