//
//  Taskview.swift
//  ToDoList
//
//  Created by Leith on 11/9/2022.
//

import SwiftUI

struct Taskview: View {
    var body: some View {
        ZStack{
            RadialGradient(colors: [.white, .blue], center: .center, startRadius: 0, endRadius: 600)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("To do list")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TaskRow(task: "Finish coding the toDo App", taskCompleted: false)
                    .padding()
                    .background(.white)
                    .cornerRadius(13)
                Spacer()
            }
        }
    }
}

struct Taskview_Previews: PreviewProvider {
    static var previews: some View {
        Taskview()
    }
}
