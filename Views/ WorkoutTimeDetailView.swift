//
//   WorkoutTimeDetailView.swift
//  FitnessApp
//
//  Created by Alex on 2/16/21.
//

import UIKit

class WorkoutTimeDetailView: UIView {
    
    //MARK: - UI

    let workoutNameTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Name:"
        lbl.font = .systemFont(ofSize: 17, weight: .bold)
        return lbl
    }()
    
    let workoutNameValueLabel = UILabel()
    
    let workoutDurationTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Duration (min):"
        lbl.font = .systemFont(ofSize: 17, weight: .bold)
        return lbl
    }()
    
    let workoutDurationTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.textAlignment = .center
        tf.keyboardType = .decimalPad
        tf.snp.makeConstraints { (make) in
            make.width.equalTo(100)
        }
        return tf
    }()
    
    let containerStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .equalSpacing
        sv.spacing = 10
        return sv
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    // MARK: - Initial UI Configuration
        
    private func configureUI() {
        backgroundColor = .white
        
        containerStackView.addArrangedSubview(workoutNameTitleLabel)
        containerStackView.addArrangedSubview(workoutNameValueLabel)
        containerStackView.addArrangedSubview(workoutDurationTitleLabel)
        containerStackView.addArrangedSubview(workoutDurationTextField)
        
        addSubview(containerStackView)
        
        containerStackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).inset(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
