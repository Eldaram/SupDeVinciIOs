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
            TaskCard(id:0, title: task.name, desc:task.desc, completed: task.completed, completeing: task.completing, deleting: task.deleting)
        }.listStyle(PlainListStyle())
    }
}
