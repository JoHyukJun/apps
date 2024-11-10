//
//  AddUpdateTaskView.swift
//  Intermediate
//
//  Created by johyukjun on 11/10/24.
//

import SwiftUI
import SwiftData


struct AddUpdateTaskView: View {
    // optional 모델로 넣어서 add 와 update 상황을 동시에 사용
    var task: ToDoModel? = nil
    
    // 넘어오는 task 가 없으면 -> nil -> newTask
    // 넘어오는 task 가 있으면 -> update
    var newTask: Bool {
        self.task == nil ? true : false
    }
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var taskName: String = ""
    @State private var important: Bool = false
    @State private var dueDate: Date = Date()
    @State private var hasDueDate: Bool = false
    

    var body: some View {
        Form {
            Label {
                TextField("Input text", text: $taskName)
            } icon: {
                Image(systemName: "pencil.circle.fill")
            }
            .padding(.vertical, 10)
            
            VStack(alignment: .leading) {
                Label {
                    Text("Check Important")
                } icon: {
                    Image(systemName: "exclamationmark.triangle.fill")
                }
                .padding(.vertical, 10)

                Picker("", selection: $important) {
                    Text("Yes").tag(true)
                    Text("No").tag(false)
                }
                .pickerStyle(.segmented)
                
                Divider()
                
                Toggle(isOn: $hasDueDate, label: {
                    Label {
                        Text("Input Due Date")
                    } icon: {
                        Image(systemName: "calender.badge.checkmark")
                    }
                })
                .padding(.vertical, 10)
                
                if hasDueDate {
                    DatePicker("", selection: $dueDate, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                }
                
                HStack(spacing: 10) {
                    Button {
                        if newTask {
                            let newTask = ToDoModel(taskName: taskName, important: important)
                            
                            newTask.dueDate = hasDueDate ? dueDate : nil
                            
                            modelContext.insert(newTask)
                        }
                        else {
                            task?.taskName = taskName
                            task?.important = important
                            
                            task?.dueDate = hasDueDate ? dueDate : nil
                        }
                        
                        dismiss()
                    } label: {
                        Text(newTask ? "ADD" : "EDIT")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal)
                    .disabled(taskName.isEmpty)
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("CANCLE")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
            }
        } // Form
        .task {
            // task 가 있는 경우 View 가 보이기 전에 SwiftData 에 저장된거 View 에 나타냄
            if let task {
                taskName = task.taskName
                important = task.important
                hasDueDate = task.dueDate != nil
                dueDate = task.dueDate ?? Date()
            }
            else {
                important = task?.important ?? false
            }
        }
        .navigationTitle(newTask ? "ADD" : "EDIT")
    }
}

#Preview("Add Task") {
    NavigationStack {
        AddUpdateTaskView()
            .modelContainer(ToDoModel.previewTodoModel)
    }
}

#Preview("Edit Task") {
    let _ = ToDoModel.previewTodoModel
    let task = ToDoModel(taskName: "Edit Task", important: false)
    
    return NavigationStack {
        AddUpdateTaskView(task: task)
    }
}
