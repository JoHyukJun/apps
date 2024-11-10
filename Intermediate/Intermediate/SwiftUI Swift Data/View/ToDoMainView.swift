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
    
    @State private var orderAsceding: Bool = true
    private var sortedTodos: [ToDoModel] {
        tasks.sorted { todo1, todo2 in
            orderAsceding ? todo1.taskName < todo2.taskName : todo1.taskName > todo2.taskName
        }
    }
    
    @State private var filterOn: Bool = false
    private var filteredTodos: [ToDoModel] {
        if filterOn {
            return tasks.filter { todo in
                todo.important == true
            }
        } else {
            return tasks
        }
    }
    
    // .forward = ascending / .reverse = descending
    @State private var sortOrder: SortOrder = SortOrder.forward
    private var sortedAndFilteredTodos: [ToDoModel] {
        let sortedTodos = tasks.sorted {
            sortOrder == .forward ? $0.taskName < $1.taskName : $0.taskName > $1.taskName
        }
        
        return filterOn ? sortedTodos.filter { $0.important } : sortedTodos
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if tasks.isEmpty {
                    ContentUnavailableView("Add New Task", systemImage: "rectangle.and.pencil.and.ellipsis", description: Text("Click Add Button"))
                }
                else {
                    List {
                        ForEach(sortedAndFilteredTodos) { task in
                            NavigationLink {
                                AddUpdateTaskView(task: task)
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
                
                ToolbarItem(placement: .automatic) {
                    Button {
                        sortOrder = sortOrder == .forward ? .reverse : .forward
                    } label: {
                        Image(systemName: "arrow.up.arrow.down.circle")
                            .symbolVariant(sortOrder == .forward ? .fill : .none)
                    }
                }
                
                ToolbarItem(placement: .automatic) {
                    Button {
                        filterOn.toggle()
                    } label: {
                        Image(systemName: "star")
                            .symbolVariant(filterOn ? .fill : .none)
                            .foregroundStyle(filterOn ? .yellow : .gray)
                    }
                }
            } // toolbar
            .sheet(isPresented: $isNewTask, content: {
                NavigationStack {
                    AddUpdateTaskView()
                }
            })
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
