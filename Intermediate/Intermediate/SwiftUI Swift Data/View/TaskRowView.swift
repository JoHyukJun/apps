//
//  TaskRowView.swift
//  Intermediate
//
//  Created by johyukjun on 11/10/24.
//

import SwiftUI
import SwiftData


struct TaskRowView: View {
    let task: ToDoModel
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(task.taskName)
                        .strikethrough(task.isCompleted, color: .red)
                    
                    Image(systemName: task.important ? "star.fill" : "")
                        .foregroundStyle(.yellow)
                }
                
                Text(task.formattedDate())
                    .font(.caption)
            }
            
            Spacer()
        }
    }
}

#Preview {
    // SwiftData 가 새로운 모델을 생성할때 현재 활성화 된 ModelContainer 를 찾아야 하는데 지정해주지 않으면 Container 가 없는 경우 error 처리
    let _ = ToDoModel.previewTodoModel
    let sampleTask = ToDoModel(taskName: "completed task", isCompleted: true, important: true, dueDate: .now)
    
    return TaskRowView(task: sampleTask)
}
