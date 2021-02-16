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
    
    //MARK: - UI
    
    private let workoutNameTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Name:"
        lbl.font = .systemFont(ofSize: 17, weight: .bold)
        return lbl
    }()
    
    private let workoutNameValueLabel = UILabel()
    
    private let workoutDurationTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Duration (min):"
        lbl.font = .systemFont(ofSize: 17, weight: .bold)
        return lbl
    }()
    
    private let workoutDurationTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.textAlignment = .center
        tf.keyboardType = .decimalPad
        tf.snp.makeConstraints { (make) in
            make.width.equalTo(100)
        }
        return tf
    }()
    
    private let containerStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .equalSpacing
        sv.spacing = 10
        return sv
    }()
    
    //MARK: - Variables
    
    private var workout: Workout
    weak var delegate: WorkoutTimeDetailDelegate?
    
    //MARK: - Init
    
    init(workout: Workout) {
        self.workout = workout
        workoutNameValueLabel.text = workout.workoutName
        workoutDurationTextField.text = workout.workoutDuration
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let duration = workoutDurationTextField.text else { return }
        workout.workoutDuration = duration
        delegate?.workoutDidUpdateDuration(workout: workout)
    }
    
    //MARK: - Initial UI Configuration
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Workout details"
        
        containerStackView.addArrangedSubview(workoutNameTitleLabel)
        containerStackView.addArrangedSubview(workoutNameValueLabel)
        containerStackView.addArrangedSubview(workoutDurationTitleLabel)
        containerStackView.addArrangedSubview(workoutDurationTextField)
        
        view.addSubview(containerStackView)
        
        containerStackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
