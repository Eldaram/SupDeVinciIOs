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
            Color.white
            RoundedRectangle(cornerRadius: 5.0)
                .fill(getColor())
                .frame(width: 350, height: 75)
                .animation(.easeInOut, value: completed)
            
            VStack {
                    Text(title.prefix(25) + (title.count > 25 ? "…" : ""))
                        .font(.title2)
                        .fontWeight(.semibold)
                Text(desc.prefix(40) + (desc.count > 40 ? "…" : ""))
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundStyle(.black)
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
    TaskCard(id: 0, title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean magna risus, pharetra iaculis purus id, posuere dapibus nibh. Nam varius a leo a suscipit. Curabitur lobortis velit in ex fringilla pulvinar. In aliquam, est et commodo mollis, urna nisl sodales nibh, placerat lobortis dolor diam id enim. Integer et eleifend metus. Praesent dapibus feugiat augue, ut tincidunt arcu molestie id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam lectus nisi, dapibus vel tortor in, tristique porta enim. Curabitur feugiat vestibulum suscipit. Nulla vitae lacinia mi.",
             desc:"Lorem ipsum dolor sit",
             completed: false, completeing: {}, deleting: {} )
}
