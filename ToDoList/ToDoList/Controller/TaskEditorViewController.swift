//
//  TaskEditorViewController.swift
//  ToDoList
//
//  Created by Andre Sanches Bocato on 08/01/19.
//  Copyright © 2019 Andre Sanches Bocato. All rights reserved.
//

import Foundation
import UIKit

class TaskEditorViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var finishEditingTaskButton: UIBarButtonItem!

    // MARK: - IBActions
    
    @IBAction func finishEditingTask(_ sender: Any) {
        completeEdition()
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        if let selectedTask = selectedTask {
            AlertHelper.showDeleteTaskAlert(controller: self, task: selectedTask)
        }
//        AlertHelper.showAlertController(controller: self, title: "Delete task", message: "Are you sure you want to delete this task? This action cannot be undone", preferredStyle: .alert, leftAction: deleteAction, rightAction: cancelAction)
    }

    // MARK: - Properties
    
    var selectedTask: Task?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextFieldsDelegate(textField: nameTextField)
        setTextFieldsDelegate(textField: descriptionTextField)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpLayoutData()
    }
    
    // MARK: - Helper Functions
    
    func setTextFieldsDelegate(textField: UITextField) {
        textField.delegate = self
    }
    
    func setUpLayoutData() {
        deleteButton.isHidden = true
        
        if let selectedTask = selectedTask {
            nameTextField?.text = selectedTask.name
            descriptionTextField?.text = selectedTask.description
            datePicker?.date = selectedTask.date
            
            deleteButton.isHidden = false
        } else {
            nameTextField.becomeFirstResponder()
        }
    }
    
    func completeEdition() {
        if nameTextField.text == "" {
            AlertHelper.showNoTaskNameAlert(controller: self)
        } else {
            saveTaskAfterEditing()
        }
    }
    
    func saveTaskAfterEditing() {
        let id = selectedTask?.id ?? UUID().uuidString      // Overwrites existing task data (selectedTask) or generates ID for a new task
        let newTask = Task(id: id, name: nameTextField.text!, description: descriptionTextField.text!, date: datePicker.date, isCompleted: false)
        TaskManager.shared.saveTask(task: newTask)
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - Extensions

extension TaskEditorViewController: UITextFieldDelegate {

    // MARK: - Textfield Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField {
            descriptionTextField.becomeFirstResponder()
        }
    }
    
}
