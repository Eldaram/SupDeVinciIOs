//
//  ContentView.swift
//  Jackpot
//
//  Created by Guillaume on 16/04/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            
            List(viewModel.tasks, id: \.name){ task in
                HStack {
                    Spacer()
                    DogCard(title: task.name, desc:task.desc, completed: task.completed)
                    Spacer()
                     
                }
                .swipeActions() {
                    Button(role: .destructive, action: {
                        removeTask(task: task)
                    }, label: {
                        Image(systemName: "trash")
                    })
                }
            }
            Button(action: {
                viewModel.getTasks()
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
        }
        .onAppear {
            viewModel.getTasks()
        }
    }
    
    private func removeTask(task: Task) {
        
    }
}

#Preview {
    ContentView()
}
