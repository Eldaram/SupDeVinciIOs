//
//  DogCard.swift
//  Jackpot
//
//  Created by Guillaume on 16/04/2024.
//

import SwiftUI

struct DogCard: View {
    let title: String
    let desc: String
    let completed: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill((completed ? .green : .blue))
                .frame(width: 250, height: 250)
            
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
        }
    }
}

#Preview {
    DogCard(title: "Do the app", desc:"Lot of work to do", completed: false)
}
