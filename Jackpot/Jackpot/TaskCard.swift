//
//  DogCard.swift
//  Jackpot
//
//  Created by Guillaume on 16/04/2024.
//

import SwiftUI

struct TaskCard: View {
    let id: Int
    let title: String
    let desc: String
    @State var completed:Bool
    let completeing: () -> ()
    let deleting: () -> ()
    
    private func getColor() -> Color{
        if completed {
            return Color.green
        }
        return Color.blue
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(getColor())
                .frame(width: 250, height: 250)
                .animation(.easeInOut, value: completed)
            
            VStack {
                ZStack {
                    Text(title)
                        .textAspect()
                }
                ZStack {
                    Text(desc)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .frame(width: 180, height: 120)
                }
            }
        }.swipeActions(edge: .trailing) {
            Button(role: .cancel, action: {
                completed.toggle()
                completeing()
            }, label: {
                Image(systemName: completed ? "nosign" : "checkmark")
            }).tint(completed ? .gray : .green)
        }.swipeActions(edge: .leading) {
            Button(role: .destructive, action: {
                deleting()
            }, label: {
                Image(systemName: "trash")
            }).tint(.red)
        }
    }
}

#Preview {
    TaskCard(id: 0, title: "Do the app", desc:"Lot of work to do", completed: false, completeing: {}, deleting: {} )
}
