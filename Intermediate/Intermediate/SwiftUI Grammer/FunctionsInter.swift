//
//  FunctionsInter.swift
//  Intermediate
//
//  Created by johyukjun on 10/31/24.
//

import SwiftUI


// MARK: - MODEL
struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let points: Int
    let isChecked: Bool
}

// MARK: - VIEWMODEL
class UserViewModel: ObservableObject {
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "derek", points: 88, isChecked: true)
        let user2 = UserModel(name: "karma", points: 99, isChecked: false)
        let user3 = UserModel(name: "police", points: 75, isChecked: true)
        let user4 = UserModel(name: "yu", points: 68, isChecked: true)
        let user5 = UserModel(name: "ai", points: 58, isChecked: false)
        let user6 = UserModel(name: "sky", points: 34, isChecked: true)
        let user7 = UserModel(name: "blue", points: 100, isChecked: false)
        let user8 = UserModel(name: "london", points: 32, isChecked: true)
        let user9 = UserModel(name: "seoul", points: 65, isChecked: false)
        let user10 = UserModel(name: "delmar", points: 78, isChecked: true)
        
        dataArray.append(contentsOf: [
            user1, user2, user3, user4, user5, user6, user7, user8, user9, user10
        ])
    }
    
    func updateFilteredArray() {
        // Sort
        /*
//        filteredArray = dataArray.sorted(by: { (user1, user2) -> Bool in
//            return user1.points > user2.points
//        })
        // 클로저 축약으로 return 생략
        // $0 = user1, $1 = user2
        filteredArray = dataArray.sorted(by: { $0.points < $1.points })
        */
        
        // Filter
        /*
        // filter 는 array 값들을 하나씩 보면서 조건에 맞는 값들만 return
//        filteredArray = dataArray.filter({ (user) -> Bool in
//            return user.points > 50
//            return user.isChecked
//            return user.name.contains("i")
//        })
        filteredArray = dataArray.filter({ $0.isChecked }).sorted(by: { $0.points > $1.points })
        */
        
        // Map
        // map 은 data 를 변형할때 사용 -> 특정값만 추출
        mappedArray = dataArray.map({ (user) -> String in
            return user.name
        })
    }
}

struct FunctionsInter: View {
    @StateObject var vm: UserViewModel = .init()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(vm.filteredArray) { user in
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            
                            HStack {
                                Text("Score: \(user.points)")
                                
                                Spacer()
                                
                                if user.isChecked {
                                    Image(systemName: "checkmark.seal.fill")
                                }
                            } // HStack
                        } // VStack
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.blue.cornerRadius(10))
                        .padding(.horizontal)
                    } // ForEach
                    
                    // map 일때 id 값이 없어 id 값을 설정해줘야함
                    ForEach(vm.mappedArray, id: \.self) { name in
                        VStack(alignment: .leading) {
                            Text(name)
                                .font(.headline)
                        } // VStack
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.blue.cornerRadius(10))
                        .padding(.horizontal)
                    } // ForEach
                }
            }
            .navigationTitle("Test score board")
        }
    }
}

#Preview {
    FunctionsInter()
}
