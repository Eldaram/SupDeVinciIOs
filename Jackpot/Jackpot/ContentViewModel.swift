//
//  ContentViewModel.swift
//  Jackpot
//
//  Created by Guillaume on 16/04/2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    var model = TaskModel()
    var received: Bool = false
    @Published var tasks: [Task] = []
    
    func getTasks() {
        tasks = model.taskList
    }
    
    func addTask(task: Task) {
        model.addTask(task: task)
        getTasks()
    }
    
    func addDefaultTask() {
        addTask(task: Task(name: "adding", desc: "serius"))
    }
}
