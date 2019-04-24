//
//  VisibilitySegmentedControl.swift
//  Backpack
//
//  Created by Anik on 24/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

@IBDesignable
class VisibilitySegmentedControl: UIControl {
    
    @IBInspectable var textColor: UIColor = .black {
        
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var selectorTextColor: UIColor = .white {
        
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var selectorBackgroundColor: UIColor = .blue {
        
        didSet {
            updateView()
        }
    }
    
    var buttons = [RoundedButtonWithShadow]()
    var selectedSegmentIndex = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        
        buttons.removeAll()
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        let buttonTitles = ["Female", "Male", "All"]
        
        for buttonTitle in buttonTitles {
            let button = RoundedButtonWithShadow.init(type: .custom)
            button.cornerRadius = 5.0
            button.titleLabel?.font =  UIFont(name: "Poppins-Bold", size: 12)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.backgroundColor = .white
            
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
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
        stackView.spacing = 16.0
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        // Drawing code
        
        // layer.cornerRadius = frame.height/2
        
    }
    
    
    @objc func buttonTapped(button: UIButton) {
        for (buttonIndex,btn) in buttons.enumerated() {
            
            btn.setTitleColor(textColor, for: .normal)
            btn.backgroundColor = .white
            
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
