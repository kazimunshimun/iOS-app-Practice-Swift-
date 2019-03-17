//
//  RoundedButtonWithShadow.swift
//  Backpack
//
//  Created by Anik on 17/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class RoundedButtonWithShadow: RoundedButton {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if shadowAdded { return }
        shadowAdded = true
        
        let shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = UIColor.clear
        shadowLayer.layer.shadowColor = UIColor.lightGray.cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        shadowLayer.layer.shadowOpacity = 0.3
        shadowLayer.layer.shadowRadius = 2
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false
        
        self.superview?.addSubview(shadowLayer)
        self.superview?.bringSubviewToFront(self)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
