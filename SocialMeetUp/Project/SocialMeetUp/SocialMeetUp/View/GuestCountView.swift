//
//  GuestCountView.swift
//  SocialMeetUp
//
//  Created by Anik on 29/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class GuestCountView: UIView {
    
    let nextButton = RoundedButtonWithBorder()
    let plusButton = UIButton()
    let minusButton = UIButton()
    let countLabel = UILabel()
    var stepCount: Int = 0
    var maxStepCount: Int = 0
    
    init(frame: CGRect, highestStepCount: Int) {
        super.init(frame: frame)
        maxStepCount = highestStepCount
        setUpViewAndConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpViewAndConstraints() {
        let countView = UIView()
        addSubview(countView)
        
        countView.translatesAutoresizingMaskIntoConstraints = false
        countView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        countView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60).isActive = true
        countView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        countView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        countView.backgroundColor = .clear
        
        let roundedCornerView = UIView()
        countView.addSubview(roundedCornerView)
        roundedCornerView.translatesAutoresizingMaskIntoConstraints = false
        roundedCornerView.topAnchor.constraint(equalTo: countView.topAnchor, constant: 24).isActive = true
        roundedCornerView.leftAnchor.constraint(equalTo: countView.leftAnchor, constant: 20).isActive = true
        roundedCornerView.rightAnchor.constraint(equalTo: countView.rightAnchor, constant: -20).isActive = true
        roundedCornerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        roundedCornerView.backgroundColor = .clear
        
        let titleLabel = UILabel()
        roundedCornerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: roundedCornerView.topAnchor, constant: 16).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: roundedCornerView.centerXAnchor).isActive = true
        titleLabel.text = "Bringing guests?"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        titleLabel.textAlignment = .center
        
        let stepperView = UIView()
        roundedCornerView.addSubview(stepperView)
        stepperView.translatesAutoresizingMaskIntoConstraints = false
        stepperView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24).isActive = true
        stepperView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stepperView.widthAnchor.constraint(equalToConstant: 215).isActive = true
        stepperView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        stepperView.backgroundColor = .clear
        
        
        stepperView.addSubview(plusButton)
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.widthAnchor.constraint(equalToConstant: 52).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        plusButton.rightAnchor.constraint(equalTo: stepperView.rightAnchor).isActive = true
        plusButton.centerYAnchor.constraint(equalTo: stepperView.centerYAnchor).isActive = true
        plusButton.setImage(UIImage(named: "up_enable"), for: .normal)
        plusButton.setImage(UIImage(named: "up_disable"), for: .disabled)
        plusButton.addTarget(self, action: #selector(stepUp(sender:)), for: .touchUpInside)
        
        stepperView.addSubview(minusButton)
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.widthAnchor.constraint(equalToConstant: 52).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        minusButton.leftAnchor.constraint(equalTo: stepperView.leftAnchor).isActive = true
        minusButton.centerYAnchor.constraint(equalTo: stepperView.centerYAnchor).isActive = true
        minusButton.setImage(UIImage(named: "down_enable"), for: .normal)
        minusButton.setImage(UIImage(named: "down_disable"), for: .disabled)
        minusButton.isEnabled = false
        minusButton.addTarget(self, action: #selector(stepDown(sender:)), for: .touchUpInside)
        
        
        stepperView.addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.centerYAnchor.constraint(equalTo: stepperView.centerYAnchor).isActive = true
        countLabel.centerXAnchor.constraint(equalTo: stepperView.centerXAnchor).isActive = true
        countLabel.text = "\(stepCount)"
        countLabel.textColor = .white
        countLabel.font = UIFont.systemFont(ofSize: 42, weight: .regular)
        countLabel.textAlignment = .center
        
        countView.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: countView.bottomAnchor, constant: -20).isActive = true
        nextButton.leftAnchor.constraint(equalTo: countView.leftAnchor).isActive = true
        nextButton.rightAnchor.constraint(equalTo: countView.rightAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        nextButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#8A56AC")
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        nextButton.cornerRadius = 26
        
    }
    
    @objc func stepUp(sender: UIButton!) {
        stepCount = stepCount + 1
        updateStepper()
    }

    @objc func stepDown(sender: UIButton!) {
        if stepCount > 0 {
            stepCount = stepCount - 1
            updateStepper()
        }
    }
    
    func updateStepper() {
        countLabel.text = "\(stepCount)"
        if stepCount == 0 {
            minusButton.isEnabled = false
        } else {
            minusButton.isEnabled = true
        }
        
        if stepCount == maxStepCount {
            plusButton.isEnabled = false
        } else {
            plusButton.isEnabled = true
        }
    }
}
