//
//  ToDoMainView.swift
//  Intermediate
//
//  Created by johyukjun on 11/10/24.
//

import SwiftUI
import SwiftData


struct ToDoMainView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [ToDoModel]
    
    @State private var showAlert: Bool = false
    @State private var taskTodoDelete: ToDoModel?
    @State private var isNewTask: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if tasks.isEmpty {
                    Spacer()
                    
                    Text("Add new job")
                        .font(.largeTitle)
                    
                    Spacer()
                }
                else {
                    List {
                        ForEach(tasks) { task in
                            NavigationLink {
                                
                            } label: {
                                TaskRowView(task: task)
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        // ACTION
                        isNewTask.toggle()
                    } label: {
                        Image(systemName: "plus.app.fill")
                    }
                }
            } // toolbar
            .navigationTitle("Todo List")
        } // NavigationStack
    }
}

#Preview {
    ToDoMainView()
        .modelContainer(ToDoModel.previewTodoModel)
}

#Preview("without task") {
    ToDoMainView()
}
