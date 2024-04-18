//
//  AddDogView.swift
//  Jackpot
//
//  Created by Guillaume on 17/04/2024.
//

import SwiftUI

struct AddTaskView: View {
    var taskOpt: Task?
    @StateObject var viewModel = AddTaskViewModel()
    
    var body: some View {
        VStack {
            Text("Task: \(viewModel.name)")
            Text("Details: \(viewModel.desc)")
            
            Form {
                TextField("Task", text: $viewModel.name) {
                    
                }
                TextField("Details", text: $viewModel.desc) {
                    
                }
                Toggle(isOn: $viewModel.priority) {
                    Text("Important")
                }
                
                Button("Submit") {
                    viewModel.addTaskList()
                    viewModel.resetData()
                }
                .alert(viewModel.errorMessage, isPresented: $viewModel.isAlert) {
                    
                }
            }
            
        }
        .onAppear() {
            if let task: Task = taskOpt {
                viewModel.setData(task: task)
            }
        }
        .navigationTitle("Add a new task")
    }
}

#Preview {
    AddTaskView(taskOpt: Task(name: "city", desc: "random"))
}
