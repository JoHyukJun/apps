//
//  DoTryCatchInter.swift
//  Intermediate
//
//  Created by johyukjun on 11/1/24.
//

import SwiftUI


// MARK: - DATA MANAGER
class DoTryCatchDataManager {
    let isActive: Bool = true
    
    func getTitle1() -> (title: String?, error: Error?) {
        if isActive {
            return ("NEW DATA DOWNLOADED", nil)
        }
        else {
            return (nil, URLError(.badServerResponse))
        }
    }
    
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("NEW DATA DOWNLOADED")
        }
        else {
            return .failure(URLError(.badServerResponse))
        }
    }
    
    func getTitle3() throws -> String {
//        if isActive {
//            return "NEW DATA DOWNLOADED"
//        }
//        else {
            throw URLError(.badServerResponse)
//        }
    }

    func getTitle4() throws -> String {
        if isActive {
            return "FINAL DATA DOWNLOADED"
        }
        else {
            throw URLError(.badServerResponse)
        }
    }
}

// MARK: - VIEWMODEL
class DoTryCatchViewModel: ObservableObject {
    @Published var text: String = "START"
    
    let dataManager = DoTryCatchDataManager()
    
    func fetchTitle() {
//        let newTitle = dataManager.getTitle1()
//        
//        if let newTitle = newTitle {
//            self.text = newTitle
//        }
        let returnedValue = dataManager.getTitle1()
        
        if let newTitle = returnedValue.title {
            self.text = newTitle
        }
        else {
            if let error = returnedValue.error {
                self.text = error.localizedDescription
            }
        }
    }
    
    func fetchTitle2() {
        let result = dataManager.getTitle2()
        
        switch result {
        case .success(let newTitle):
            self.text = newTitle
        case .failure(let error):
            self.text = error.localizedDescription
        }
    }
    
    // do catch 구문을 사용하면 do 부분에서 return 된 값이 catch 되는 값은 throw return 된 값이 자동으로 들어가게 됨
    func fetchTitle3() {
        do {
            let newTitle = try? dataManager.getTitle3()
            if let newTitle = newTitle {
                self.text = newTitle
            }
            
            let finalTitle = try dataManager.getTitle4()
            self.text = finalTitle
        } catch let error {
            self.text = error.localizedDescription
        }
    }
}

// MARK: - VIEW
struct DoTryCatchInter: View {
    @StateObject var vm: DoTryCatchViewModel = .init()
    
    var body: some View {
        Text(vm.text)
            .font(.title)
            .frame(width: 300, height: 300)
            .background(Color.green)
            .onTapGesture {
//                vm.fetchTitle()
//                vm.fetchTitle2()
                vm.fetchTitle3()
            }
    }
}

#Preview {
    DoTryCatchInter()
}
