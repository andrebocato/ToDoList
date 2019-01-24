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

    static var alertController: UIAlertController?
    static private let okBlock: ((UIAlertAction) -> Void) = { action -> Void in
        AlertHelper.alertController?.dismiss(animated: true, completion: nil)
    }
    
    // Ok alert
    static func showOkAlert(in controller: UIViewController,
                          title: String?,
                          message: String?,
                          preferredStyle: UIAlertController.Style) {
        
        alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: okBlock)
        alertController?.addAction(okAction)
        if let alertController = alertController {
            controller.present(alertController, animated: true, completion: nil)
        }
    }
    
    // Deletion confirmation alert
    static func showDeletionAlert(in controller: UIViewController,
                                    title: String?,
                                    message: String?,
                                    preferredStyle: UIAlertController.Style,
                                    deleteActionBlock: @escaping (()->())) {
        
        alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: okBlock)
        let deleteAction = UIAlertAction(title: "Ok", style: .default) { action -> Void in
            deleteActionBlock()
        }
        
        alertController?.addAction(cancelAction)
        alertController?.addAction(deleteAction)
        if let alertController = alertController {
            controller.present(alertController, animated: true, completion: nil)
        }
    }
    
    // Du's Function
//
//    static func showAlert(in controller: UIViewController,
//                          title: String,
//                          message: String,
//                          okActionCompletion: @escaping (()->())? = nil,
//                          cancelActionCompletion: @escaping (()->())? = nil) {
//
//        let alertController = UIAlertController(title: title, message: , preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
//            guard let completion = okActionCompletion else {
//                alertController.dismiss(animatedL true, completion: nil)
//                return
//            }
//            completion()
//        }
//        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
//            cancelActionCompletion?()
//        }
//
//        alertController.addAction(cancelAction)
//        alertController.addAction(okAction)
//        controller.present(alertController, animated: true, completion: nil)
//    }
    
    
    // Refactor both functions in generic ones
    
//    static func showNoTaskNameAlert(controller: UIViewController) {
//        let noTaskNameAlertController = UIAlertController(title: "Your task needs a name", message: "", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Ok", style: .default) { action -> Void in
//            noTaskNameAlertController.dismiss(animated: true, completion: nil)
//        }
//        
//        noTaskNameAlertController.addAction(okAction)
//        controller.present(noTaskNameAlertController, animated: true, completion: nil)
//    }
    
//    static func showConfirmActionAlert(controller: UIViewController, okActionBlock: @escaping (()->())) {
//        let deleteTaskAlertController = UIAlertController(title: "Delete task", message: "Are you sure you want to delete this task? This action cannot be undone", preferredStyle: .alert)
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
//            deleteTaskAlertController.dismiss(animated: true, completion: nil)
//        }
//        
//        let confirmAction = UIAlertAction(title: "Ok", style: .default) { action -> Void in
//            okActionBlock("ANSWER")
//            controller.navigationController?.popToRootViewController(animated: true)
//        }
//        
//        deleteTaskAlertController.addAction(cancelAction)
//        deleteTaskAlertController.addAction(confirmAction)
//        controller.present(deleteTaskAlertController, animated: true, completion: nil)
//    }
    
}
