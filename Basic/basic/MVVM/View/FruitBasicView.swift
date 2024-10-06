//
//  FruitBasicView.swift
//  Basic
//
//  Created by johyukjun on 10/6/24.
//

import SwiftUI

struct FruitBasicView: View {
    // property
    // SubView 에서 사용
    //@ObservedObject var fruitViewModel = FruitViewModel()
    
    // View 가 처음 생성, 초기화 할 때 부모 View 에서 사용
    @StateObject var fruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruits) { fruit in
                        HStack(spacing: 20) {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        } // HStack
                    } // ForEach
                }
            } // List
            //.onAppear {
            //    fruitViewModel.getFruits()
            //}
            
            NavigationLink(
                destination: SecondFruitScreen(fruitViewModel: fruitViewModel),
                label: {
                    Image(systemName: "arrow.right")
            })
        } // VStack
    }
}

// SecondFruitScreen
struct SecondFruitScreen: View {
    // property
    @ObservedObject var fruitViewModel = FruitViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            
            VStack(spacing: 20) {
                ForEach(fruitViewModel.fruits) { fruit in
                    Text(fruit.name)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("back")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    FruitBasicView()
}
