//
//  TripKindSegmentedControl.swift
//  Backpack
//
//  Created by Anik on 24/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

@IBDesignable
class TripKindSegmentedControl: VisibilitySegmentedControl {

    override func updateView() {
        buttons.removeAll()
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        selectedSegmentIndex = 0
        
        let buttonTitles = ["Backpack", "Vacation", "Buisness"]
        
        for buttonTitle in buttonTitles {
            let button = RoundedButtonWithShadow.init(type: .custom)
            button.cornerRadius = 5.0
            button.titleLabel?.font =  UIFont(name: "Poppins-Bold", size: 10)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.backgroundColor = .black
            
            button.addTarget(self, action: #selector(buttonTouched(button:)), for: .touchUpInside)
            buttons.append(button)
            //            button.setTitleColor(button.isSelected ? UIColor.gray : selectorTextColor, for: .normal)
        }
        
        buttons[selectedSegmentIndex].setTitleColor(selectorTextColor, for: .normal)
        buttons[selectedSegmentIndex].backgroundColor = selectorBackgroundColor
        
        // Create a StackView
        
        let stackView = UIStackView.init(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 26.0
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
    @objc func buttonTouched(button: UIButton) {
        for (buttonIndex,btn) in buttons.enumerated() {
            
            btn.setTitleColor(textColor, for: .normal)
            btn.backgroundColor = .black
            
            if btn == button {
                selectedSegmentIndex = buttonIndex
                btn.setTitleColor(selectorTextColor, for: .normal)
                btn.backgroundColor = selectorBackgroundColor
                
            }
        }
        
        sendActions(for: .valueChanged)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
