//
//  Taskview.swift
//  ToDoList
//
//  Created by Leith on 11/9/2022.
//

import SwiftUI
import Foundation

struct TaskView: View {
    var body: some View {
        ZStack{
            
            RadialGradient(colors: [.white, .blue], center: .center, startRadius: 0, endRadius: 600)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:18){
                
                Text("To do list")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TaskRow(task: "Finish coding the toDo App", taskCompleted: false)
                    .padding()
                    .background(.white)
                    .cornerRadius(13)
                    .shadow(color: .black, radius: 5)
                
                TaskRow(task: "Prepare diner", taskCompleted: false)
                    .padding()
                    .background(.white)
                    .cornerRadius(13)
                    .shadow(color: .black, radius: 5)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct Taskview_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
