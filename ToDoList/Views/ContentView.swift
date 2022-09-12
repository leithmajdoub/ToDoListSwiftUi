//
//  ContentView.swift
//  ToDoList
//
//  Created by Leith on 11/9/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realmManager = RealmManager()
    @State private var showAddTaskView: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            RadialGradient(colors: [.white, .blue], center: .center, startRadius: 0, endRadius: 600)
                .edgesIgnoringSafeArea(.all)
            
            TaskView()
                .environmentObject(realmManager)
            
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        
        }
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView()
                .environmentObject(realmManager)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
