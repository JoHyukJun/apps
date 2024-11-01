//
//  WeakSelfInter.swift
//  Intermediate
//
//  Created by johyukjun on 11/1/24.
//

import SwiftUI


// MARK: - VIEWMODEL
class WeakSelfInterViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("init")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        
        self.getData()
    }
    
    deinit {
        print("deinit")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {
        
        // Strong Reference
        /*
        DispatchQueue.main.asyncAfter(deadline: .now() + 100) {
            // UI update 라 main thread 에서 진행되어야 함
            DispatchQueue.main.async {
                // self.data 는 strong reference(기본값)
                self.data = "NEW DATA"
            }
        }
        */
        
        // Weak Reference
        DispatchQueue.main.asyncAfter(deadline: .now() + 100) { [ weak self ] in
            DispatchQueue.main.async {
                // weak reference 일때에는 optinal 값을 참조함으로 self 뒤에 ? 붙여줘야함
                self?.data = "NEW DATA"
            }
        }
    }
}

// MARK: - VIEW
struct WeakSelfInter: View {
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink("move second page") {
                WeakSelfInter2()
            }
            .navigationTitle("first page")
        }
        .overlay {
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green)
                .padding()
        }
    }
}

struct WeakSelfInter2: View {
    @StateObject var vm: WeakSelfInterViewModel = .init()
    
    var body: some View {
        VStack {
            Text("second page")
                .font(.largeTitle)
                .foregroundStyle(.red)
            
            NavigationLink("move first page") {
                WeakSelfInter()
            }
        } // VStack
        
        if let data = vm.data {
            Text(data)
        }
    }
}

#Preview {
    WeakSelfInter()
}
