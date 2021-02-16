//
//  FitnessAppTests.swift
//  FitnessAppTests
//
//  Created by Alex on 2/15/21.
//

import XCTest
@testable import FitnessApp

class FitnessAppTests: XCTestCase {

    var dataSource: WorkoutDataSource!
    let tableView = UITableView()
    
    override func setUp() {
        super.setUp()
        dataSource = WorkoutDataSource(manager: WorkoutDataManager())
        tableView.register(WorkoutTimeCell.self, forCellReuseIdentifier: WorkoutTimeCell.reuseIdentifier)
        //init with 20 workouts
        for _ in 1...20 {
            dataSource.manager.addWorkout(workout: Workout(workoutName: "test", workoutDuration: "15"))
        }
    }
    
    func test_adding_workout() {
        dataSource.manager.addWorkout(workout: Workout(workoutName: "Run", workoutDuration: "27"))
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 20, section: 0)) as! WorkoutTimeCell
        
        XCTAssertEqual(dataSource.manager.workoutsCount, 21)
        XCTAssertEqual(numberOfRows, 21)
        XCTAssertEqual(cell.workoutNameLabel.text, "Run")
        XCTAssertEqual(cell.workoutDurationLabel.text, "27 min")
    }
    
    func test_listing_workouts() {
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(dataSource.manager.workoutsCount, 20)
        XCTAssertEqual(numberOfRows, 20)
    }
    
    func test_updating_workout() {
        dataSource.manager.editWorkout(at: 0, editedWorkout: Workout(workoutName: "test", workoutDuration: "30"))
        
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! WorkoutTimeCell
        
        XCTAssertEqual(dataSource.manager.workout(at: 0).workoutDuration, "30")
        XCTAssertEqual(cell.workoutNameLabel.text, "test")
        XCTAssertEqual(cell.workoutDurationLabel.text, "30 min")
    }
    
    func test_deleting_workout() {
        dataSource.tableView(tableView, commit: .delete, forRowAt: IndexPath(row: 0, section: 0))
        
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(dataSource.manager.workoutsCount, 19)
        XCTAssertEqual(numberOfRows, 19)
    }

}
