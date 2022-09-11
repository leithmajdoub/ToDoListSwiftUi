//
//  TaskRow.swift
//  ToDoList
//
//  Created by Leith on 11/9/2022.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var taskCompleted: Bool
    
    var body: some View {
        HStack(spacing: 20){
            
            Image(systemName: taskCompleted ? "checkmark.seal.fill" : "seal")
            
            Text(task)
            
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Do laundry", taskCompleted: true)
    }
}
