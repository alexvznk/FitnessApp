//
//  WorkoutTimeListViewController.swift
//  FitnessApp
//
//  Created by Alex on 2/15/21.
//

import UIKit

class WorkoutTimeListViewController: UIViewController {
    
    private let tableView = UITableView()
    private let dataSource: WorkoutDataSource
    private var selectedIndex = Int()
    
    // MARK: - Init
    
    init(dataSource: WorkoutDataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.register(WorkoutTimeCell.self, forCellReuseIdentifier: WorkoutTimeCell.reuseIdentifier)
    }

    
    // MARK: - Initial UI Configuration
    
    private func configureUI() {
        navigationItem.title = "Workouts"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedAddWorkout))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Add Workout Functionality
    
    @objc private func tappedAddWorkout() {
        let addWorkoutAC = UIAlertController(title: "Log your workout:", message: nil, preferredStyle: .alert)
        addWorkoutAC.addTextField { (workoutNameTextField) in
            workoutNameTextField.placeholder = "Workout name"
            workoutNameTextField.autocapitalizationType = .sentences
        }
        addWorkoutAC.addTextField { (workoutDurationTextField) in
            workoutDurationTextField.placeholder = "Workout duration (min)"
            workoutDurationTextField.keyboardType = .decimalPad
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned addWorkoutAC, unowned self] _ in
            let workoutName = addWorkoutAC.textFields![0].text!
            let workoutDuration = addWorkoutAC.textFields![1].text!
            self.saveWorkout(workoutName: workoutName, workoutDuration: workoutDuration)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        addWorkoutAC.addAction(saveAction)
        addWorkoutAC.addAction(cancelAction)
        present(addWorkoutAC, animated: true, completion: nil)
    }
    
    private func saveWorkout(workoutName: String, workoutDuration: String) {
        dataSource.manager.addWorkout(workout: Workout(workoutName: workoutName, workoutDuration: workoutDuration))
        tableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UITableView Delegate

extension WorkoutTimeListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let workout = dataSource.manager.workout(at: indexPath.row)
        let vc = WorkoutTimeDetailViewController(workout: workout)
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - WorkoutTimeDetail Delegate

extension WorkoutTimeListViewController: WorkoutTimeDetailDelegate {
    
    func workoutDidUpdateDuration(workout: Workout) {
        dataSource.manager.editWorkout(at: selectedIndex, editedWorkout: workout)
        tableView.reloadData()
    }
    
}
