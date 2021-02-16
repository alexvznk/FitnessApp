//
//  WorkoutDataManager.swift
//  FitnessApp
//
//  Created by Alex on 2/15/21.
//

class WorkoutDataManager: WorkoutDataManaging {
    
    private(set) var workouts = [Workout]()
    
    var workoutsCount: Int {
        return workouts.count
    }
    
    func workout(at index: Int) -> Workout {
        return workouts[index]
    }
    
    func addWorkout(workout: Workout) {
        workouts.append(workout)
    }
    
    func deleteWorkout(at index: Int) {
        workouts.remove(at: index)
    }
    
    func editWorkout(at index: Int, editedWorkout: Workout) {
        workouts[index] = editedWorkout
    }
}

