//
//  RoundedViewWithShadow.swift
//  Backpack
//
//  Created by Anik on 22/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class RoundedViewWithShadow: UIView {

    var shadowAdded: Bool = false
    var shadowLayer: UIView!
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if shadowAdded { return }
        shadowAdded = true
        
        shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = UIColor.clear
        shadowLayer.layer.shadowColor = UIColor.lightGray.cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        shadowLayer.layer.shadowOpacity = 0.4
        shadowLayer.layer.shadowRadius = 3
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false
        
        self.superview?.addSubview(shadowLayer)
        self.superview?.bringSubviewToFront(self)
    }
    
    public func hideShadow() {
        shadowLayer?.layer.shadowOpacity = 0.0
    }
    
    public func showShadow() {
        shadowLayer?.layer.shadowOpacity = 1.0
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
