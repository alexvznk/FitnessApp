//
//  WorkoutTimeCell.swift
//  FitnessApp
//
//  Created by Alex on 2/15/21.
//

import UIKit
import SnapKit

class WorkoutTimeCell: UITableViewCell {
    
    // MARK: - UI

    let workoutNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .bold)
        return lbl
    }()
    
    let workoutDurationLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemGray
        lbl.font = .systemFont(ofSize: 15)
        return lbl
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.spacing = 8
        return sv
    }()
    
    var workout: Workout? {
        didSet {
            if let workout = workout {
                workoutNameLabel.text =  workout.workoutName
                workoutDurationLabel.text = workout.workoutDuration + " min"
            }
        }
    }
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    // MARK: - Initial UI Configuration
    
    private func configureUI() {
        selectionStyle = .none
        
        stackView.addArrangedSubview(workoutNameLabel)
        stackView.addArrangedSubview(workoutDurationLabel)
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
