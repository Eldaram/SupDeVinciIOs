//
//  TaskModel.swift
//  Jackpot
//
//  Created by COURS on 17/04/2024.
//

import Foundation

class TaskModel {
    
    static var shared = TaskModel()
    
    var taskList: [Task] = [ ]
    
    private init() {
        genTask()
    }
    
    func getTasks() -> [Task] {
        return taskList;
    }
    
    func addTask(task:Task) {
        taskList.append(task)
    }
    
    func genTask() {
        taskList.append(Task(name:"test", desc:"this has to change"))
        taskList.append(Task(name:"test2", desc:"say yes to change"))
    }
}
