//
//  DataManager.swift
//  ToDoListRealm
//
//  Created by Антон Бобрышев on 27.08.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private init () {}
    
    func createTestData(_ completion: @escaping () -> Void) {
        if !UserDefaults.standard.bool(forKey: "done") {
            
            UserDefaults.standard.set(true, forKey: "done")
            
            let shoppingList = TaskList()
            shoppingList.name = "Shopping List"
            
            let moviesList = TaskList(value: ["Movies List", Date(), [["Pulp Fiction"],["Star Wars", "Done!", Date(), true]]])
            
            let milk = Task()
            milk.name = "Milk"
            milk.note = "2L"
            
            let bread = Task(value: ["Bread", "", Date(), true])
            let apples = Task(value: ["name": "Apples", "note": "2Kg"])
            
            shoppingList.tasks.append(milk)
            shoppingList.tasks.insert(contentsOf: [bread, apples], at: 0)
            
            DispatchQueue.main.async {
                StorageManager.shared.save(taskList: [shoppingList, moviesList])
                completion()
            }
        }
    }
}
