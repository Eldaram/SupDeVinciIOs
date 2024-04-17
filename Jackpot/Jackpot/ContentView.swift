//
//  ContentView.swift
//  Jackpot
//
//  Created by Guillaume on 16/04/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var isDeletedView:Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TaskList(tasks: viewModel.tasks.filter {!$0.deleted})
                Button(action: {
                    viewModel.getTasks()
                }, label: {
                    Text("Refresh")
                })
                Spacer()
                Button(action: {
                    viewModel.getTasks()
                }, label: {
                    NavigationLink("Deletes object") {
                        TaskList(tasks: viewModel.tasks.filter {$0.deleted})
                    }
                })
                
                
            }
            .onAppear {
                viewModel.getTasks()
            }
        }
    }
    
    private func validateTask(task: Task) {
        task.completed = true
    }
}

#Preview {
    ContentView()
}


struct ColorAnimationInSwiftUI: View {
    
    @State private var animate = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(animate ? Color.orange : Color.gray.opacity(0.4))
            Text("DevTechie")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(width: 300, height: 300)
        .onTapGesture {
            animate.toggle()
        }
        .animation(.easeInOut, value: animate)
    }
}
