//
//  ThreadsInter.swift
//  Intermediate
//
//  Created by johyukjun on 11/1/24.
//

import SwiftUI


// MARK: - VIEWMODEL
class ThreadsViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        DispatchQueue.global().async {
            let newData = self.downloadData()
            
            self.dataArray = newData
        }
    }
    
    func downloadData() -> [String] {
        // sample data
        var data: [String] = []
        
        for x in 0..<1000 {
            data.append("\(x)")
            
            print(data)
        }
        
        return data
    }
}

struct ThreadsInter: View {
    @StateObject var vm: ThreadsViewModel = .init()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                Text("Data load")
                    .font(.title)
                    .fontWeight(.bold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { data in
                    Text(data)
                        .font(.headline)
                        .foregroundStyle(.red)
                }
            } // VStack
        } // ScrollView
    }
}

#Preview {
    ThreadsInter()
}
