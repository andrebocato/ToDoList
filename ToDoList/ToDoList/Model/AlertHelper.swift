//
//  AlertHelper.swift
//  ToDoList
//
//  Created by Andre Sanches Bocato on 23/01/19.
//  Copyright © 2019 Andre Sanches Bocato. All rights reserved.
//

import Foundation
import UIKit

class AlertHelper {

    // showAlertController with 2 actions (leftAction and rightAction) o 1 action (if rightAction is nil)
    static func showAlertController(controller: UIViewController, title: String?, message: String?, preferredStyle: UIAlertController.Style, leftAction: UIAlertAction!, rightAction: UIAlertAction? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        alertController.addAction(leftAction)
        if let rightAction = rightAction {
            alertController.addAction(rightAction)
        }
        
        controller.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    
    static func showNoTaskNameAlert(controller: UIViewController) {
        let noTaskNameAlertController = UIAlertController(title: "Your task needs a name.", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { action -> Void in
            controller.dismiss(animated: true, completion: nil)
        }
        noTaskNameAlertController.addAction(okAction)
        controller.present(noTaskNameAlertController, animated: true, completion: nil)
    }
    
    static func showDeleteTaskAlert(controller: UIViewController, task: Task) {
        let deleteTaskAlertController = UIAlertController(title: "Delete task", message: "Are you sure you want to delete this task? This action cannot be undone", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            controller.dismiss(animated: true, completion: nil)
        }
        let deleteAction = UIAlertAction(title: "Ok", style: .default) { action -> Void in
            TaskManager.shared.deleteTask(id: task.id)
            controller.navigationController?.popToRootViewController(animated: true)
        }
        
        deleteTaskAlertController.addAction(cancelAction)
        deleteTaskAlertController.addAction(deleteAction)
        controller.present(deleteTaskAlertController, animated: true, completion: nil)
    }
    
}
