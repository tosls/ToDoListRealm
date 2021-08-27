//
//  Extension + UITableViewCell.swift
//  ToDoListRealm
//
//  Created by Антон Бобрышев on 27.08.2021.
//

import UIKit

extension UITableViewCell {
    
    func configure(with taskList: TaskList) {
        let currentTasks = taskList.tasks.filter("isComplete = false")
        let complitedTasks = taskList.tasks.filter("isComplete = true")
        
        var content = defaultContentConfiguration()
        content.text = taskList.name
        
        if !currentTasks.isEmpty {
            content.secondaryText = "\(currentTasks.count)"
            accessoryType = .none
        } else if !complitedTasks.isEmpty {
            content.secondaryText = nil
            accessoryType = .checkmark
        } else {
            accessoryType = .none
            content.secondaryText = "0"
        }
        
        contentConfiguration = content
    }
}
