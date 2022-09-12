//
//  RealManager.swift
//  ToDoList
//
//  Created by Leith on 12/9/2022.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init(){
        openRealm()
        getTasks()
    }
    
    // Realm is like a box to store data so first we need a func to open the box
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        } catch  {
            print("Error opening realm: \(error)")
        }
    }
    
    func addTask(tasktitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write({
                    let newTask = Task(value: ["title": tasktitle, "completed": false])
                    localRealm.add(newTask)
                    getTasks()
                    print("Added new task to Realm: \(newTask)")
                })
            } catch  {
                print("Error adding task to realm: \(error)")
            }
        }
    }
    
    func getTasks() {
        if let localRealm = localRealm {
            
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            
            allTasks.forEach{ task in
                tasks.append(task)
            }
            
        }
    }
    
    func updateTasks(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    getTasks()
                    print("Updated task with id \(id)! Competed status: \(completed)")
                }
            } catch  {
                print("Error updating task in realm: \(error)")
            }
        }
    }
    
    func deleteTask(id: ObjectId){
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else {return}
                
                try localRealm.write{
                    localRealm.delete(taskToDelete)
                    getTasks()
                }
            } catch {
                print("Error deleting task with id \(id) in realm: \(error)")
            }
        }
    }
}
