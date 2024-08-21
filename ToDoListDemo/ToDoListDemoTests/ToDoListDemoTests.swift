//
//  ToDoListDemoTests.swift
//  ToDoListDemoTests
//
//  Created by Shriram Kadam on 17/08/24.
//

//import XCTest
//@testable import ToDoListDemo
//
//final class ToDoListDemoTests: XCTestCase {
//    var viewController: ViewController!
//   
//    override func setUpWithError() throws {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
//        viewController.loadViewIfNeeded()  // Load the view hierarchy
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        viewController = nil
//        super.tearDown()
//    }
//    
//    func testAddingNewTodoItem() {
//        // Given
//        let initialCount = viewController.todoItems.count
//        viewController.addItemTextField.text = "New Task"
//        
//        // When
//        viewController.addItem(UIButton())
//        
//        // Then
//        XCTAssertEqual(viewController.todoItems.count, initialCount + 1, "The item count should increase by 1.")
//        XCTAssertEqual(viewController.todoItems.last?.title, "New Task", "The last item should be 'New Task'.")
//        XCTAssertEqual(viewController.todoItems.last?.isCompleted, false, "Newly added items should not be completed.")
//    }
//
//    func testMarkingItemAsCompleted() {
//        // Given
//        viewController.todoItems = [TodoItem(title: "Task 1", isCompleted: false)]
//        let indexPath = IndexPath(row: 0, section: 0)
//        
//        // When
//        viewController.tableView(viewController.tableView, didSelectRowAt: indexPath)
//        
//        // Then
//        XCTAssertTrue(viewController.todoItems[0].isCompleted, "The item should be marked as completed.")
//    }
//
//    func testDeletingTodoItem() {
//        // Given
//        viewController.todoItems = [TodoItem(title: "Task 1", isCompleted: false)]
//        let initialCount = viewController.todoItems.count
//        let indexPath = IndexPath(row: 0, section: 0)
//        
//        // When
//        viewController.tableView(viewController.tableView, commit: .delete, forRowAt: indexPath)
//        
//        // Then
//        XCTAssertEqual(viewController.todoItems.count, initialCount - 1, "The item count should decrease by 1.")
//        XCTAssertTrue(viewController.todoItems.isEmpty, "The todoItems array should be empty.")
//    }
//
//    
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}

import XCTest
@testable import ToDoListDemo

class TodoListTests: XCTestCase {

    var viewController: ViewController!
    
    override func setUpWithError() throws {
        super.setUp()
        // Initialize the view controller from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        viewController.loadViewIfNeeded()  // Load the view hierarchy
    }

    override func tearDownWithError() throws {
        viewController = nil
        super.tearDown()
    }

    func testAddingNewTodoItem() {
        // Given
        let initialCount = viewController.todoItems.count
        viewController.addItemTextField.text = "New Task"
        
        // When
        viewController.addItem(UIButton())
        
        // Then
        XCTAssertEqual(viewController.todoItems.count, initialCount + 1, "The item count should increase by 1.")
        XCTAssertEqual(viewController.todoItems.last?.title, "New Task", "The last item should be 'New Task'.")
        XCTAssertEqual(viewController.todoItems.last?.isCompleted, false, "Newly added items should not be completed.")
    }

    func testMarkingItemAsCompleted() {
        // Given
        viewController.todoItems = [TodoItem(title: "Task 1", isCompleted: false)]
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        viewController.tableView(viewController.tableView, didSelectRowAt: indexPath)
        
        // Then
        XCTAssertTrue(viewController.todoItems[0].isCompleted, "The item should be marked as completed.")
    }

    func testDeletingTodoItem() {
        // Given
        viewController.todoItems = [TodoItem(title: "Task 1", isCompleted: false)]
        let initialCount = viewController.todoItems.count
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        viewController.tableView(viewController.tableView, commit: .delete, forRowAt: indexPath)
        
        // Then
        XCTAssertEqual(viewController.todoItems.count, initialCount - 1, "The item count should decrease by 1.")
        XCTAssertTrue(viewController.todoItems.isEmpty, "The todoItems array should be empty.")
    }
}



