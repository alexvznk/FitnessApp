//
//  WorkoutDataManaging.swift
//  FitnessApp
//
//  Created by Alex on 2/15/21.
//

protocol WorkoutDataManaging {
    var workouts: [Workout] { get }
    var workoutsCount: Int { get }
    func workout(at index: Int) -> Workout
    func addWorkout(workout: Workout)
    func deleteWorkout(at index: Int)
    func editWorkout(at index: Int, editedWorkout: Workout)
}
