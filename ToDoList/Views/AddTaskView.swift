//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Leith on 11/9/2022.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var taskName: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            
            RadialGradient(colors: [.white, .blue], center: .center, startRadius: 0, endRadius: 600)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20){
                
                Text("Add a task \(Image(systemName: "checklist"))")
                    .font(.title)
                    .bold()
                    .padding()
                
                TextField("Tell me champ 👂", text: $taskName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .shadow(color: .gray, radius: 3)
                    
                
                Button {
                    if taskName != "" {
                        realmManager.addTask(tasktitle: taskName)
                    }
                
                    dismiss()
                } label: {
                    Text("Let's do it")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.indigo)
                        .cornerRadius(13)
                        .shadow(color: .black, radius: 5)
                }
                .offset(y: -5)

                    
                Spacer()
            }
            .padding()
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
 
