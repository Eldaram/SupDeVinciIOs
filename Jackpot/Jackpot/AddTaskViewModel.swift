//
//  AddTaskViewModel.swift
//  Jackpot
//
//  Created by COURS on 18/04/2024.
//

import SwiftUI

class AddTaskViewModel: ObservableObject {
    var model = TaskModel.shared
    
    @Published var name: String = ""
    @Published var desc: String = ""
    @Published var priority: Bool = false
    
    var isAlert: Bool = false
    var errorMessage: String = ""
    
    private func createTask() -> Task? {
        guard name != "" || name.isEmpty else {
            isAlert = true
            errorMessage = "You task SHOULD NOT be empty."
            return nil
        }
        let task: Task = Task(name: name, desc: desc)
        task.priority = priority
        return task
    }
    
    func addTaskList() {
        guard let task = createTask() else { return }
        model.taskList.append(task)
    }
    
    func resetData() {
        name = ""
        desc = ""
        priority = false
    }
    
    func setData(task: Task) {
        name = task.name
        desc = task.desc
        priority = task.priority
    }
}
