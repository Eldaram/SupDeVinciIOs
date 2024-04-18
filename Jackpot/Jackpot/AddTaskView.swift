//
//  AddDogView.swift
//  Jackpot
//
//  Created by Guillaume on 17/04/2024.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var taskOpt: Task?
    var taskUpdate: ((String, String, Bool, Bool, Bool) -> ())?
    @StateObject var viewModel = AddTaskViewModel()
    
    var body: some View {
            Form {
                TextField("Task", text: $viewModel.name) {
                    
                }
                TextField("Details", text: $viewModel.desc) {
                    
                }
                Toggle(isOn: $viewModel.priority) {
                    Text("Important")
                }
                
                if (taskOpt != nil) {
                    Toggle(isOn: $viewModel.completed) {
                        Text("Completed")
                            .foregroundStyle(.green)
                    }
                    Toggle(isOn: $viewModel.deleted) {
                        Text("Deleted")
                            .foregroundStyle(.red)
                    }
                }
                
                Button(taskOpt != nil ? "Edit" : "Submit") {
                    if (taskOpt != nil) {
                        viewModel.updateTaskList(taskUpdate: taskUpdate)
                    }
                    else {
                        viewModel.addTaskList()
                        viewModel.resetData()
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }
                .alert(viewModel.errorMessage, isPresented: $viewModel.isAlert) {
                    
                }
            }
        .onAppear() {
            if let task: Task = taskOpt {
                viewModel.setData(task: task)
            }
        }
        .navigationTitle(taskOpt != nil ? "Edit a task" : "Add a new task")
    }
}

#Preview {
    AddTaskView()
}
