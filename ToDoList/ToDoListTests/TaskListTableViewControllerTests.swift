//
//  TaskListTableViewControllerTests.swift
//  ToDoListTests
//
//  Created by Andre Sanches Bocato on 18/01/19.
//  Copyright © 2019 Andre Sanches Bocato. All rights reserved.
//

import Foundation
import UIKit
import XCTest
@testable import ToDoList

class TaskListTableViewControllerTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: TaskListTableViewController!
    
    // MARK: - Life Cycle
    
    override func setUp() {
        super.setUp()
        
        TaskManager.shared.deleteAllTasks()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "TaskListTableViewController") as? TaskListTableViewController
        
        UIApplication.shared.keyWindow!.rootViewController = sut
        
        // Test and Load the View at the Same Time!
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.view)
    }

    override func tearDown() {
        super.tearDown()
        
        TaskManager.shared.deleteAllTasks()
    }
    
    // MARK: - Tests
    
    func testLoadingTableViewDataWithCompletedTask() {
        TaskManager.shared.deleteAllTasks()
        
        let completedTask = Task(id: UUID().uuidString, name: "completedTask", description: "teste", date: Date(), isCompleted: true)
        TaskManager.shared.saveTask(task: completedTask)
        
        let upcomingTask = Task(id: UUID().uuidString, name: "completedTask", description: "teste", date: Date(), isCompleted: false)
        TaskManager.shared.saveTask(task: upcomingTask)

        XCTAssert(TaskManager.shared.tasks.count == 2)
    }
    
    func testPerformSegues() {
        let taskEditor = TaskEditorViewController()
        
        let segueEditTask = UIStoryboardSegue(identifier: "SegueEditTask", source: sut, destination: taskEditor)
        sut.prepare(for: segueEditTask, sender: (Any).self)
        
        let segueNewTask = UIStoryboardSegue(identifier: "SegueNewTask", source: sut, destination: taskEditor)
        sut.prepare(for: segueNewTask, sender: (Any).self)
    }
    
    func testSetUpAttributedText() {
        let task = Task(id: "id", name: "task", description: "description", date: Date(), isCompleted: false)
        
        _ = "\(sut.setUpAttributedText(task: task))"
    }
    
    func testMarkCompletionStateAndSaveTask() {
        let task = Task(id: "id", name: "task", description: "description", date: Date(), isCompleted: false)
        TaskManager.shared.saveTask(task: task)
        
        let indexPath = IndexPath(row: 0, section: 0)
        sut.markCompletionStateAndSaveTask(indexPath: indexPath)
    }
    
    func testMarkAsUpcomingOrComplete() {
        let task = Task(id: "id", name: "task", description: "description", date: Date(), isCompleted: false)
        TaskManager.shared.saveTask(task: task)
        let indexPath = IndexPath(row: 0, section: 0)
        _ = sut.markAsUpcomingOrComplete(indexPath: indexPath)
        
        let task0 = Task(id: "id0", name: "task", description: "description", date: Date(), isCompleted: true)
        TaskManager.shared.saveTask(task: task0)
        let indexPath0 = IndexPath(row: 0, section: 1)
        _ = sut.markAsUpcomingOrComplete(indexPath: indexPath0)
    }
    
    func testSetUpTitleForSection() {
        var section = 0
        _ = sut.setUpTitleForSection(section: section)
        section = 1
        _ = sut.setUpTitleForSection(section: section)
        section = 2
        _ = sut.setUpTitleForSection(section: section)
    }
    
    func testSetUpNumberOfRowsInSection() {
        var section = 0
        _ = sut.setUpNumberOfRowsInSection(section: section)
        section = 1
        _ = sut.setUpNumberOfRowsInSection(section: section)
        section = 2
        _ = sut.setUpNumberOfRowsInSection(section: section)
    }
    
    func testConfigureCell() {
        let indexPath = IndexPath(row: 0, section: 0)
        
        XCTAssert(TaskManager.shared.tasks.count == 0)
        
        var cell = UITableViewCell()
        cell = sut.configureCell(cell: cell, indexPath: indexPath)
        
        let task = Task(id: "id", name: "task", description: "description", date: Date(), isCompleted: false)
        TaskManager.shared.saveTask(task: task)

        XCTAssert(TaskManager.shared.tasks.count > 0)

        cell = UITableViewCell()
        cell = sut.configureCell(cell: cell, indexPath: indexPath)
    }
    
    func testSetUpDeleteAction() {
        _ = sut.setUpDeleteAction()
    }
    
    func testSetUpEditAction() {
        _ = sut.setUpEditAction()
    }
    
    func testSetUpMarkCompletionStateAction() {
        _ = sut.setUpMarkCompletionStateAction(completionTitle: "")
    }
    
    // MARK: - Data source methods tests
    
//    func testCellForRowAt() {
//        // @TODO:
//    }
//
//    func testDidSelectRowAt() {
//        // @TODO:
//    }
//
//    func testEditActionsForRowAt() {
//        // @TODO:
//    }
    
}
