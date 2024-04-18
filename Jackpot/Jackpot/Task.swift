//
//  taskModel.swift
//  Jackpot
//
//  Created by COURS on 17/04/2024.
//

import Foundation

class Task {
    var name: String
    var desc: String
    var completed: Bool = false
    var deleted: Bool = false
    var priority: Bool = false
    
    init(name: String, desc: String) {
        self.name = name
        self.desc = desc
    }
    
    func completing(){
        completed = !completed
    }
    
    func deleting(){
        deleted = !deleted
    }
    
    func prioritizing(){
        priority = !priority
    }
    
    func update(name: String, desc: String, completed: Bool, deleted: Bool, priority: Bool) {
        self.name = name
        self.desc = desc
        self.completed = completed
        self.deleted = deleted
        self.priority = priority
    }
}
