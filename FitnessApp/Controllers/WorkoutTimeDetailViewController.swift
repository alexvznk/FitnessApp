//
//  WorkoutTimeDetailViewController.swift
//  FitnessApp
//
//  Created by Alex on 2/15/21.
//

import UIKit
import SnapKit

protocol WorkoutTimeDetailDelegate: class {
    func workoutDidUpdateDuration(workout: Workout)
}

class WorkoutTimeDetailViewController: UIViewController {
    
    private var workout: Workout
    private let rootView = WorkoutTimeDetailView()
    weak var delegate: WorkoutTimeDetailDelegate?
    
    override func loadView() {
        self.view = rootView
    }
    
    //MARK: - Init
    
    init(workout: Workout) {
        self.workout = workout
        rootView.workoutNameValueLabel.text = workout.workoutName
        rootView.workoutDurationTextField.text = workout.workoutDuration
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Workout details"
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let duration = rootView.workoutDurationTextField.text else { return }
        workout.workoutDuration = duration
        delegate?.workoutDidUpdateDuration(workout: workout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
