//
//  GuestCountView.swift
//  SocialMeetUp
//
//  Created by Anik on 29/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class GuestCountView: UIView {
    
    //let nextButton = RoundedCornerButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViewAndConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpViewAndConstraints() {
        let errorView = UIView()
        addSubview(errorView)
        
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        errorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60).isActive = true
        errorView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        errorView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        errorView.backgroundColor = .clear
        
        let roundedCornerView = UIView()
        errorView.addSubview(roundedCornerView)
        roundedCornerView.translatesAutoresizingMaskIntoConstraints = false
        roundedCornerView.topAnchor.constraint(equalTo: errorView.topAnchor, constant: 24).isActive = true
        roundedCornerView.leftAnchor.constraint(equalTo: errorView.leftAnchor, constant: 20).isActive = true
        roundedCornerView.rightAnchor.constraint(equalTo: errorView.rightAnchor, constant: -20).isActive = true
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
        
        let plusButton = UIButton()
        stepperView.addSubview(plusButton)
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.widthAnchor.constraint(equalToConstant: 52).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        plusButton.rightAnchor.constraint(equalTo: stepperView.rightAnchor).isActive = true
        plusButton.centerYAnchor.constraint(equalTo: stepperView.centerYAnchor).isActive = true
        plusButton.setImage(UIImage(named: "up_enable"), for: .normal)
        plusButton.setImage(UIImage(named: "up_disable"), for: .disabled)
        
        let minusButton = UIButton()
        stepperView.addSubview(minusButton)
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.widthAnchor.constraint(equalToConstant: 52).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        minusButton.leftAnchor.constraint(equalTo: stepperView.leftAnchor).isActive = true
        minusButton.centerYAnchor.constraint(equalTo: stepperView.centerYAnchor).isActive = true
        minusButton.setImage(UIImage(named: "down_enable"), for: .normal)
        minusButton.setImage(UIImage(named: "down_disable"), for: .disabled)
        minusButton.isEnabled = false
        
        let countLabel = UILabel()
        stepperView.addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.centerYAnchor.constraint(equalTo: stepperView.centerYAnchor).isActive = true
        countLabel.centerXAnchor.constraint(equalTo: stepperView.centerXAnchor).isActive = true
        countLabel.text = "0"
        countLabel.textColor = .white
        countLabel.font = UIFont.systemFont(ofSize: 42, weight: .regular)
        countLabel.textAlignment = .center
        
        
        let nextButton = RoundedButtonWithBorder()
        errorView.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: errorView.bottomAnchor, constant: -20).isActive = true
        nextButton.leftAnchor.constraint(equalTo: errorView.leftAnchor).isActive = true
        nextButton.rightAnchor.constraint(equalTo: errorView.rightAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        nextButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#8A56AC")
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        nextButton.cornerRadius = 26
        
        /*
        errorView.addSubview(nextButton)
        nextButton.cornerRadius = 26
        nextButton.topRight = true
        nextButton.topLeft = true
        nextButton.bottomRight = true
        nextButton.bottomLeft = true
        nextButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#8A56AC")
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: errorView.bottomAnchor, constant: 16).isActive = true
        nextButton.leftAnchor.constraint(equalTo: errorView.leftAnchor, constant: 16).isActive = true
        nextButton.rightAnchor.constraint(equalTo: errorView.rightAnchor, constant: -16).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        nextButton.setTitle("NEXT", for: .normal)
       // nextButton.backgroundColor = .red
 */
    }

}
