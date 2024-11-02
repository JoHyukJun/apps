//
//  GenericInter.swift
//  Intermediate
//
//  Created by johyukjun on 11/1/24.
//

import SwiftUI


// MARK: - MODEL
struct StringModel {
    let info: String?
    
    func removeInfo() -> StringModel {
        return StringModel(info: nil)
    }
}

// case 1.
// Model 에서 Bool 값을 추가하려고 할때, 단순한게 struct 하나 더 만들어서 사용
// 이렇게 하면 반복적으로 불필요한 code 생성 및 struct 생성으로 인한 메모리 낭비 -> 앱속도 저하
struct BoolModel {
    let info: Bool?
    
    func removeInfo() -> BoolModel {
        return BoolModel(info: nil)
    }
}

// case 2.
// Generic type 을 사용하게 되면 any 타입으로 생성
// anyType 을 통일되게 사용하기 위해서 대문자 T 로 표시
struct GenericModel<T> {
    let info: T?
    
    func removeInfo() -> GenericModel {
        return GenericModel(info: nil)
    }
}

// MARK: - VIEWMODEL
class GenericInterViewModel: ObservableObject {
    @Published var stringModel = StringModel(info: "Hello, There!")
    @Published var boolModel = BoolModel(info: true)
    
    @Published var genericStringModel = GenericModel(info: "SHIT")
    @Published var genericBoolModel = GenericModel(info: true)
    
    func removeData() {
        self.stringModel = stringModel.removeInfo()
        self.boolModel = boolModel.removeInfo()
        
        self.genericStringModel = genericStringModel.removeInfo()
        self.genericBoolModel = genericBoolModel.removeInfo()
    }
}

// case 3.
// View 타입에서 Generic 사용
// Generic View 에서 content 를 AnyType 으로 설정하는데 이것을 특정 type 으로 지정 가능
struct GenericView<T: View>: View {
    let title: String
    let content: T
    
    var body: some View {
        VStack {
            Text(title)
            
            content
        }
    }
}

// MARK: - VIEW
struct GenericInter: View {
    @StateObject var vm: GenericInterViewModel = .init()
    
    var body: some View {
        VStack(spacing: 20) {
            GenericView(title: "GenericView", content: Text("New Content"))
            
            Divider()
            
            VStack(spacing: 10) {
                Text("Model example")
                    .font(.title2)
                
                Text(vm.stringModel.info ?? "NO DATA")
                Text(vm.boolModel.info?.description ?? "NO DATA")
            }
            
            Divider()
            
            VStack(spacing: 10) {
                Text("Generic example")
                    .font(.title2)
                
                Text(vm.genericStringModel.info ?? "NO DATA")
                Text(vm.genericBoolModel.info?.description ?? "NO DATA")
            }
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

#Preview {
    GenericInter()
}
