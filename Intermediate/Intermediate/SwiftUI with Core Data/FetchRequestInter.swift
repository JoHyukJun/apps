//
//  ContentView.swift
//  Intermediate
//
//  Created by johyukjun on 11/8/24.
//

import SwiftUI
import CoreData


struct FetchRequestInter: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    // @FetchRequest -> Core Data <-> SwiftUI View 연결
    @FetchRequest(entity: FishEntity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FishEntity.name, ascending: true)]) var fishes: FetchedResults<FishEntity>

    @State var textField: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Input new fish name", text: $textField)
                    .withDefaultTextField()
                
                Button {
                    addItem()
                } label: {
                    Text("Add")
                }
                .withDefaultButtonFormat()
                
                List {
                    ForEach(fishes) { fish in
                        Text(fish.name ?? "")
                            .onTapGesture {
                                updateItem(fish: fish)
                            }
                    } // ForEach
                    .onDelete(perform: deleteItems)
                } // List
                .listStyle(.plain)
                .navigationTitle("Fish Market")
            }
//            .toolbar {
//                ToolbarItem(placement: .automatic) {
//                    Button {
//                        addItem()
//                    } label: {
//                        Text("Add")
//                    }
//                }
//            }
        }
    }
    
    private func saveItem() {
        do {
            try viewContext.save()
        } catch {
            print("ERROR SAVE DATA: \(error.localizedDescription)")
        }
    }

    private func addItem() {
        withAnimation(.spring()) {
            let newFish = FishEntity(context: viewContext)
            newFish.name = textField
            
            saveItem()
            
            textField = ""
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation(.spring()) {
            guard let idx = offsets.first else { return }
            
            let selectedFish = fishes[idx]
            viewContext.delete(selectedFish)
            
            saveItem()
        }
    }
    
    private func updateItem(fish: FishEntity) {
        withAnimation(.spring()) {
            guard let currentName = fish.name else { return }
            
            let newName = currentName + " (updated)"
            fish.name = newName
            
            saveItem()
        }
    }
}

struct DefaultTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding(.leading)
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

extension View {
    func withDefaultTextField() -> some View {
        self.modifier(DefaultTextField())
    }
}

#Preview {
    FetchRequestInter().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
