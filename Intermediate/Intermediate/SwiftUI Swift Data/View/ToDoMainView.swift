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
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        Button {
                                            // index set
                                            taskTodoDelete = task
                                            showAlert = true
                                        } label: {
                                            Text("Delete")
                                        }
                                        .tint(.red)
                                    }
                                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                        Button {
                                            task.isCompleted.toggle()
                                        } label: {
                                            Image(systemName: task.isCompleted ? "arrow.uturn.backward.circle.fill" : "checkmark.circle.fill")
                                        }
                                        .tint(task.isCompleted ? .green : .blue)
                                    }
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
            .alert("Do you want to delete this task?", isPresented: $showAlert) {
                Button(role: .destructive) {
                    guard let taskTodoDelete = taskTodoDelete else { return }
                    // SwiftData 는 autosave 기능이 활성화 되어 있어 context 내용이 변경될때 자동으로 저장
                    modelContext.delete(taskTodoDelete)
                } label: {
                    Text("Delete")
                }
            }
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
