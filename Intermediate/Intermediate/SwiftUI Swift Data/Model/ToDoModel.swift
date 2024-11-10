//
//  ToDoModel.swift
//  Intermediate
//
//  Created by johyukjun on 11/10/24.
//

import Foundation
import SwiftData


@Model
class ToDoModel {
    var taskName: String
    var isCompleted: Bool
    var important: Bool
    var dueDate: Date?
    
    init(taskName: String, isCompleted: Bool = false, important: Bool, dueDate: Date? = nil) {
        self.taskName = taskName
        self.isCompleted = isCompleted
        self.important = important
        self.dueDate = dueDate
    }
}

extension ToDoModel {
    @MainActor
    static var previewTodoModel: ModelContainer {
        let container: ModelContainer
        
        do {
            container = try ModelContainer(for: ToDoModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        } catch {
            fatalError("Failed to create preview model container: \(error)")
        }
        
        container.mainContext.insert(ToDoModel(taskName: "Clean the house", important: false))
        container.mainContext.insert(ToDoModel(taskName: "Learn SwiftUI", important: true))
        
        let dueDateTodo = ToDoModel(taskName: "Report to the boss", important: true)
        dueDateTodo.dueDate = dateFormatter().date(from: "2024-11-10")
        container.mainContext.insert(dueDateTodo)
        
        let completedTodo = ToDoModel(taskName: "Launch the app", isCompleted: true, important: false)
        container.mainContext.insert(completedTodo)
        
        return container
    }
    
    func formattedDate() -> String {
        guard let dueDate = dueDate else { return "No due date" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: dueDate)
    }
    
    static func dateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter
    }
}
