//
//  Task.swift
//  ToDoList
//
//  Created by Leith on 12/9/2022.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id:ObjectId
    @Persisted var title: String = ""
    @Persisted var completed: Bool = false
}
