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
    @State var completed: Bool
    var deleted: Bool
    @State var important: Bool
    let completeing: () -> ()
    let deleting: () -> ()
    let priorising: () -> ()
    
    private func getColor() -> Color{
        if deleted {
            return Color.red
        }
        if completed {
            return Color.green
        }
        if important {
            return Color.orange
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
                .animation(.easeInOut, value: important)
            
            VStack {
                    Text(title.prefix(25) + (title.count > 25 ? "…" : ""))
                        .font(.title2)
                        .fontWeight(.semibold)
                Text(desc.prefix(40) + (desc.count > 40 ? "…" : ""))
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundStyle(.white)
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
                Image(systemName: deleted ? "arrow.up.trash.fill" : "trash")
            }).tint(deleted ? .blue : .red)
        }
        .swipeActions(edge: .leading) {
            Button(role: .cancel, action: {
                important.toggle()
                priorising()
            }, label: {
                Image(systemName: "exclamationmark.triangle")
            }).tint(.orange)
        }
    }
}

#Preview {
    TaskCard(id: 0, title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean magna risus, pharetra iaculis purus id, posuere dapibus nibh. Nam varius a leo a suscipit. Curabitur lobortis velit in ex fringilla pulvinar. In aliquam, est et commodo mollis, urna nisl sodales nibh, placerat lobortis dolor diam id enim. Integer et eleifend metus. Praesent dapibus feugiat augue, ut tincidunt arcu molestie id. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam lectus nisi, dapibus vel tortor in, tristique porta enim. Curabitur feugiat vestibulum suscipit. Nulla vitae lacinia mi.",
             desc:"Lorem ipsum dolor sit",
             completed: false, deleted: false, important: false, completeing: {}, deleting: {}, priorising: {} )
}
