//
//  ProfileTripsSegmentedControl.swift
//  Backpack
//
//  Created by Anik on 19/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

@IBDesignable
class ProfileTripsSegmentedControl: UIControl {

    var buttons = [UIButton]()
    var selector: UIView!
    var selectorBackground: UIView!
    var selectedSegmentIndex = 0
    
    @IBInspectable var textColor: UIColor = .lightGray {
        
        didSet {
            updateView()
        }
    }
    
    
    @IBInspectable var selectorColor: UIColor = .darkGray {
        
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var selectorBackgroundColor: UIColor = .darkGray {
        
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var selectorTextColor: UIColor = .green {
        
        didSet {
            updateView()
        }
    }
    
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
        
        let buttonTitles = ["In Route", "Past trips", "Planned"]
        
        for buttonTitle in buttonTitles {
            
            let button = UIButton.init(type: .custom)
            button.titleLabel?.font =  UIFont(name: "Poppins-Bold", size: 12)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
            //            button.setTitleColor(button.isSelected ? UIColor.gray : selectorTextColor, for: .normal)
        }
        
        let imageButton = UIButton.init(type: .custom)
        imageButton.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
        imageButton.setImage(UIImage(named: "photo_unselected"), for: .normal)
        
        buttons.append(imageButton)
        
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        
        let selectorWidth = frame.width / CGFloat(buttonTitles.count + 1)
        
        let y =    (self.frame.maxY - self.frame.minY) - 3.0
        
        selector = UIView.init(frame: CGRect.init(x: 0, y: y, width: selectorWidth, height: 3.0))
        //selector.layer.cornerRadius = frame.height/2
        selector.backgroundColor = selectorColor
        addSubview(selector)
        
        selectorBackground = UIView.init(frame: CGRect.init(x: 0, y: y + 1, width: frame.width, height: 1.0))
        selectorBackground.backgroundColor = selectorBackgroundColor
        addSubview(selectorBackground)
        
        // Create a StackView
        
        let stackView = UIStackView.init(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0.0
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
            if buttonIndex == (buttons.count - 1) {
                btn.setImage(UIImage(named: "photo_unselected"), for: .normal)
            }
            
            if btn == button {
                selectedSegmentIndex = buttonIndex
                
                let  selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                
                UIView.animate(withDuration: 0.3, animations: {
                    
                    self.selector.frame.origin.x = selectorStartPosition
                })
                
                btn.setTitleColor(selectorTextColor, for: .normal)
                
                if buttonIndex == (buttons.count - 1) {
                    btn.setImage(UIImage(named: "photo_selected"), for: .normal)
                }
            }
        }
        
        sendActions(for: .valueChanged)
    }

}
