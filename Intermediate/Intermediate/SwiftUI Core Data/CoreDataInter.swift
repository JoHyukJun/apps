//
//  CoreDataInter.swift
//  Intermediate
//
//  Created by johyukjun on 11/8/24.
//

import SwiftUI
import CoreData

// @FetchRequest 를 사용하지 않고, View 와 Business logic 을 분리해서 작성

// MARK: - VIEWMODEL
class CoreDataInterViewModel: ObservableObject {
    // Core Data container
    let container: NSPersistentContainer
    
    // Core Data 에 fetch 불러온것을 View 로 넘기기 위한 변수
    @Published var savedEntities: [Fish] = []
    
    init() {
        self.container = NSPersistentContainer(name: "FishContainer")
        self.container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING DATA: \(error.localizedDescription)")
            }
            else {
                print("SUCCESS LOADING DATA: \(description)")
            }
        }
        
        fetchFish()
    }
    
    // MARK: - FUNCTION
    // CoreData 에서 데이터 가져오기
    func fetchFish() {
        let request = NSFetchRequest<Fish>(entityName: "Fish")
        
        // container 에 request 한 것을 fetch 가져오기
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch {
            print("ERROR FETCH CORE DATA: \(error.localizedDescription)")
        }
    }
    
    // CoreData 저장하기
    func saveFish() {
        do {
            try container.viewContext.save()
            fetchFish()
        } catch {
            print("ERROR SAVE CORE DATA: \(error.localizedDescription)")
        }
    }
    
    func addFish(text: String) {
        let newFish = Fish(context: container.viewContext)
        newFish.name = text
        
        saveFish()
    }
    
    func deleteFish(indexSet: IndexSet) {
        guard let idx = indexSet.first else { return }
        
        let entity = savedEntities[idx]
        container.viewContext.delete(entity)
        
        saveFish()
    }
    
    func updateFish(fish: Fish) {
        let curName = fish.name ?? ""
        let newName = curName + " (UPDATED)"
        
        fish.name = newName
        
        saveFish()
    }
}

// MARK: - VIEW
struct CoreDataInter: View {
    @StateObject var vm: CoreDataInterViewModel = .init()
    @State var textFiled: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("INPUT NEW FISH", text: $textFiled)
                    .withDefaultTextField()
                
                Button {
                    guard !textFiled.isEmpty else { return }
                    vm.addFish(text: textFiled)
                    
                    textFiled = ""
                } label: {
                    Text("Add")
                        .withDefaultButtonFormat()
                }
                
                List {
                    ForEach(vm.savedEntities) { fish in
                        Text(fish.name ?? "NO DATA")
                            .onTapGesture {
                                vm.updateFish(fish: fish)
                            }
                    } // ForEach
                    .onDelete(perform: vm.deleteFish)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Fish Market")
        }
    }
}

#Preview {
    CoreDataInter()
}
