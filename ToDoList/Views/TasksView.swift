//
//  Taskview.swift
//  ToDoList
//
//  Created by Leith on 11/9/2022.
//

import SwiftUI
import Foundation

struct TaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        ZStack{
            
            RadialGradient(colors: [.white, .blue], center: .center, startRadius: 0, endRadius: 600)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:18){
                
                Text("To do list")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                List{
                    ForEach(realmManager.tasks, id: \.id){task in
                        if !task.isInvalidated {
                            TaskRow(task: task.title, taskCompleted: task.completed)
                                .padding()
                                .background(.white)
                                .cornerRadius(13)
                                .shadow(color: .black, radius: 5)
                                .onTapGesture {
                                    realmManager.updateTasks(id: task.id, completed: !task.completed)
                                }
                                .swipeActions(edge: .trailing){
                                    Button(role: .destructive){
                                        realmManager.deleteTask(id: task.id)
                                    }label:{
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                    }
                }
                .onAppear{
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                }
                
                
                
                
                Spacer()
            }
            .padding()
        }
    }
}

struct Taskview_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManager())
    }
}
