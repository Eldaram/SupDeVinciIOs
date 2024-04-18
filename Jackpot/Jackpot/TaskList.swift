//
//  tasklist.swift
//  Jackpot
//
//  Created by COURS on 17/04/2024.
//

import SwiftUI

struct TaskList: View {
    var tasks: [Task]
    
    var body: some View {
        List(tasks, id: \.name){ task in
            NavigationLink(destination: AddTaskView(taskOpt: task)) {
                TaskCard(id:0, title: task.name, desc:task.desc, completed: task.completed, deleted: task.deleted, important: task.priority, completeing: task.completing, deleting: task.deleting, priorising: task.prioritizing)
            }
        }.listStyle(PlainListStyle())
    }
}
