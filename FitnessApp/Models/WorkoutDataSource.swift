//
//  WorkoutDataSource.swift
//  FitnessApp
//
//  Created by Alex on 2/15/21.
//

import UIKit

class WorkoutDataSource: NSObject, UITableViewDataSource {
    
    let manager: WorkoutDataManaging
    
    init(manager: WorkoutDataManaging) {
        self.manager = manager
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.workoutsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutTimeCell.reuseIdentifier, for: indexPath) as! WorkoutTimeCell
        cell.workout = manager.workout(at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            manager.deleteWorkout(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

